

class DynamicListInfo extends Object{

  bool success;

  int totalProperty;

  List<Data> data;

  DynamicListInfo(this.success,this.totalProperty,this.data,);

//  factory DynamicListInfo.fromJson(Map<String, dynamic> srcJson) => _$DynamicListInfoFromJson(srcJson);

}


class Data extends Object {

  List<dynamic> abbreviationPhotos;

  int commentNum;

  String content;

  String createTimeText;

  int iceStadiumId;

  String iceStadiumName;

  int id;

  String nickName;

  int openFlag;

  List<dynamic> photos;

  int praiseFlag;

  int pubFlag;

  int readNum;

  String realName;

  int recomFlag;

  String type;

  String typeText;

  int upNum;

  int userId;

  String userPhoto;

  String videoCoverPhoto;

  String videoUrl;

  Data(this.abbreviationPhotos,this.commentNum,this.content,this.createTimeText,this.iceStadiumId,this.iceStadiumName,this.id,this.nickName,this.openFlag,this.photos,this.praiseFlag,this.pubFlag,this.readNum,this.realName,this.recomFlag,this.type,this.typeText,this.upNum,this.userId,this.userPhoto,this.videoCoverPhoto,this.videoUrl,);

//  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);


}

  
