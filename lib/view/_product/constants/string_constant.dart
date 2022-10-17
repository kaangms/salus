// ignore_for_file: constant_identifier_names

class MessageConstants {
  MessageConstants._init();
  static final MessageConstants _instance = MessageConstants._init();
  static MessageConstants get instance => _instance;
  static const String EMPTY_MESSAGE = 'Herhangi bir mesaj bulunmuyor';
}
