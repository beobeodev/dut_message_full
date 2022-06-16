const socketConsts = require('./socket_consts');

class SocketController {
    constructor(userService, messageService, socketRepo){
        this._userService = userService;
        this._messageService = messageService;
        this._socketRepo = socketRepo;
    }

    async converMessageHandler(socket, io, data) {
      let message;
      message = await this._messageService.addMessageToConver(data.converId, {author: data.fromUserId, content: data.content, message_type: data.message_type});
      let result = {
          converId: data.converId,
          message: message,
      }
      io.to(`${this._socketRepo.getSocketIdByUserId(data.toUserId)}`).to(`${this._socketRepo.getSocketIdByUserId(data.fromUserId)}`).emit(socketConsts.EVENT_RECEIVE_CONVER_MESSAGE, result);
    }

    async  roomMessageHandler(socket, io, data) {
      let message;
      message = await this._messageService.addMessageToRoom(data.roomId, {author: data.fromUserId, content: data.content, message_type: data.message_type});
      let result = {
          roomId: data.roomId,
          message: message,
      }
      io.to(data.roomId).emit(socketConsts.EVENT_RECEIVE_ROOM_MESSAGE, result);
    }

    async friendRequestHandler(socket, io, data) {
      const F_request = await this._userService.createFriendRequest(data.fromId, data.toId);
      io.to(`${this._socketRepo.getSocketIdByUserId(data.toId)}`).emit(socketConsts.EVENT_RECEIVE_FRIEND_REQUEST, F_request);
    }

    async addFriendHandler(socket, io, data) {
      await this._userService.addFriend(data.fromId, data.toId);
      const F_request = await this._userService.getFriendRequest(data.fromId, data.toId);
      const existConver = await this._messageService.checkExistConver([data.fromId, data.toId]);
      let conver;
      if(existConver) {
          conver = existConver;
      } else {
          conver = await this._messageService.createConversation([data.fromId, data.toId]);
      }
      await this._userService.removeFriendRequest(F_request._id);
      io.to(`${this._socketRepo.getSocketIdByUserId(data.fromId)}`).emit(socketConsts.EVENT_NOTIFY_ACCEPT_FRIEND, {'infoFriend': F_request.to, 'conver': conver});
      io.to(`${this._socketRepo.getSocketIdByUserId(data.toId)}`).emit(socketConsts.EVENT_NOTIFY_ACCEPT_FRIEND, {'infoFriend': F_request.from, 'conver': conver});
    }
}

module.exports = SocketController;
