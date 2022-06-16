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
}

module.exports = SocketController;
