import 'dart:io';
class AnalysisImage {
  late File image;
  String? imagePath;
  bool goodLight = true;
  String lightingCondition = "well";
  List<bool> condition = [true, false];
  void setImage(File img){
    image = img;
  }
  void setImgPath(String p){
    imagePath = p;
  }
  void setLightingCondition(){
    if(goodLight == true){
      lightingCondition = 'well';
    }
    else{
      lightingCondition = 'poor';
    }
  }
  void setLightingFlag(bool flag){
    goodLight = flag;
  }
}