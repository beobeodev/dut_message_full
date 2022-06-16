const SocketController = require('./socketUtils/socket_controller');
const SocketRepo = require('./socketUtils/socket_repo');
const SocketConsts = require('./socketUtils/socket_consts');
const {userService, roomService, messageService} = require('./utility/modulesInjection');

let socketRepo = new SocketRepo();
let socketController = new SocketController(userService, messageService, socketRepo);
module.exports = async (socket, io) => {
  const userId = socket.handshake.query.userId;
  socketRepo.addUserToMap(userId, socket.id);
  const list_roomId = await roomService.getListRoomIdsByUserId(userId);
  list_roomId.map((id) => {
      socket.join(`${id._id}`);
  })
  onConverMessage(socket, io);
  onRoomMessage(socket, io);
  onFriendRequest(socket, io);
  onAddFriend(socket, io);
  onDelFriend(socket, io);
  onCancelFriendRequest(socket, io);
  onCreateRoom(socket, io);
  onAddUserToRoom(socket, io);
  onLeaveRoom(socket, io);
}

function onConverMessage(socket, io) {
  socket.on(SocketConsts.EVENT_SEND_CONVER_MESSAGE, (data) => {
      socketController.converMessageHandler(socket, io, data);
  })
}

function onRoomMessage(socket, io) {
  socket.on(SocketConsts.EVENT_SEND_ROOM_MESSAGE, (data) => {
      socketController.roomMessageHandler(socket, io, data);
  })
}

function onFriendRequest(socket, io) {
  socket.on(SocketConsts.EVENT_SEND_FRIEND_REQUEST, (data) => {
      socketController.friendRequestHandler(socket, io, data);
  })
}

function onAddFriend(socket, io) {
  socket.on(SocketConsts.EVENT_ACCEPT_FRIEND_REQUEST, (data) => {
      socketController.addFriendHandler(socket, io, data);
  })
}

function onDelFriend(socket, io){
  socket.on(SocketConsts.EVENT_SEND_CANCEL_FRIEND, (data) => {
      socketController.removeFriendHandler(socket, io, data);
  })
}

function onCancelFriendRequest(socket, io) {
  socket.on(SocketConsts.EVENT_CANCEL_FRIEND_REQUEST, (data) => {
      socketController.removeFriendRequest(socket, io, data);
  })
}

function onCreateRoom(socket, io) {
  socket.on(SocketConsts.EVENT_SEND_CREATE_ROOM, (data) => {
      socketController.createRoomHandler(socket, io, data);
  })
}

function onJoinRoom(socket, io) {
  socket.on(SocketConsts.EVENT_SEND_JOIN_ROOM, (data) => {
      socketController.joinRoomHandler(socket, io, data);
  })
}

function onAddUserToRoom(socket, io) {
  socket.on(SocketConsts.EVENT_SEND_ADD_USER_TO_ROOM, (data) => {
      socketController.addUserToRoom(socket, io, data);
  })
}

function onLeaveRoom(socket, io) {
  socket.on(SocketConsts.EVENT_SEND_LEAVE_ROOM, (data) => {
      socketController.leaveRoomHandler(socket, io, data);
  })
}