import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:meetmeyou_web/constants/string_constants.dart';
import 'package:path_provider/path_provider.dart';

import '../mmy/idgen.dart';

Future<String> storeFile(File file, {required String path}) async {
  await FirebaseStorage.instance.ref(path).putFile(file);
  return FirebaseStorage.instance.ref(path).getDownloadURL();
}

class StoragePath {
  static String profilePhoto(String uid) => '/users/${uid}/${uid}.png';
  static String contactGroupPhoto(String uid, String cid) => '/users/${uid}/contacts/groups/${cid}.png';
  static String eventPhoto(String eid) => '/events/${eid}/${eid}.png';
  static String eventPhotoGallery(String eid,) => '/photoAlbums/$eid/${idGenerator()}.png';
  static String discussionPhoto(String did,) => '/discussions/${did}/${did}.png';
  static String discussionChatGallery(String did, String pid) => '/discussions/${did}/chat/${did}.png';
  static String discussionPhotoGallery(String did, String folder, String pid) => '/discussions/${did}/$folder/${did}.png';
}

/// TODO: Deprecate
Future<String> storeProfilePicture(File file, {required String uid}) async {
  final path = 'profile_pictures/${uid}.png';
  // imageLib.Image image = imageLib.decodeImage(file.readAsBytesSync())!;
  // imageLib.Image profilePicture = imageLib.copyResize(image, height: 720);
  // final profileFile = File(await getFilePath(uid));
  // File profilePic=await profileFile.writeAsBytes(imageLib.encodePng(profilePicture));
  // File profilePic = await File('${uid}.png').writeAsBytes(imageLib.encodePng(profilePicture));
  await FirebaseStorage.instance.ref(path).putFile(file);
  return FirebaseStorage.instance.ref(path).getDownloadURL();
}

/// TODO: Deprecate
Future<String> messagePicture(File file, {required String did}) async {
  String id = idGenerator();
  final path = 'discussions/${did}/${id}.png';
  // imageLib.Image image = imageLib.decodeImage(file.readAsBytesSync())!;
  // imageLib.Image profilePicture = imageLib.copyResize(image, height: 720);
  // final profileFile = File(await getFilePath(uid));
  // File profilePic=await profileFile.writeAsBytes(imageLib.encodePng(profilePicture));
  // File profilePic = await File('${uid}.png').writeAsBytes(imageLib.encodePng(profilePicture));
  await FirebaseStorage.instance.ref(path).putFile(file);
  return FirebaseStorage.instance.ref(path).getDownloadURL();
}

/// TODO: Deprecate
Future<String> storeEventPicture(File file, {required String eid}) async {
  final path = 'event_pictures/${eid}.png';
  // imageLib.Image image = imageLib.decodeImage(file.readAsBytesSync())!;
  // imageLib.Image eventPicture = imageLib.copyResize(image, height: 1440);
  // final profileFile = File(await getFilePath(eid));
  // var profilePic = profileFile..writeAsBytesSync(imageLib.encodePng(eventPicture));
  // File profilePic = await File('${eid}.png').writeAsBytes(imageLib.encodePng(eventPicture));
  await FirebaseStorage.instance.ref(path).putFile(file);
  return FirebaseStorage.instance.ref(path).getDownloadURL();
}

/// TODO: Deprecate
Future<String> getFilePath(String uid)async {
  final folderName = StringConstants.appName.toLowerCase();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  //final directory = Directory("storage/emulated/0/$folderName");
  final directory = Directory("${appDocDir.path}/$folderName");
  if ((await directory.exists())) {
  } else {
    directory.create();
  }
  String filePath = '${directory.path}/${uid}.png';
  return filePath;
}
