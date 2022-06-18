const UserRepository = require('../repositories/Users'),
      AuthController = require('../controllers/auth'),
      AuthService = require('../services/authService'),
      UserController = require('../controllers/Users'),
      UserService = require('../services/userService'),
      AuthMiddleware = require('../middleware/auth'),
      RoomRepository = require('../repositories/Room'),
      RoomService = require('../services/roomService'),
      RoomController = require('../controllers/Rooms'),
      ConversationRepository = require('../repositories/Conversation'),
      ConversationService = require('../services/conversationService'),
      ConversationController = require('../controllers/Conversations'),
      MessageRepository = require('../repositories/Messages'),
      MessageService = require('../services/messageService'),
      RequestResetPwRepo = require('../repositories/RequestResetPw')

let userRepo = new UserRepository();
let authService = new AuthService(userRepo);
let authController = new AuthController(authService);
let requestResetPwRepo = new RequestResetPwRepo();

let authMiddleware = new AuthMiddleware(userRepo);

let roomRepo = new RoomRepository();
let roomService = new RoomService(roomRepo);
let roomController = new RoomController(roomService);

let conversationRepo = new ConversationRepository();
let conversationService = new ConversationService(conversationRepo);
let conversationController = new ConversationController(conversationService);

let userService = new UserService(userRepo, requestResetPwRepo);
let userController = new UserController(userService);

let messageRepo = new MessageRepository();
let messageService = new MessageService(messageRepo, conversationRepo, roomRepo, userRepo);



module.exports = {
    authController: authController,
    userService: userService,
    userController: userController,
    authMiddleware: authMiddleware,
    conversationController: conversationController,
    roomService: roomService,
    roomController: roomController,
    messageService: messageService,
}