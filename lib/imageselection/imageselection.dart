import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SingleImageUpload extends StatefulWidget {
  @override
  _SingleImageUploadState createState() {
    return _SingleImageUploadState();
  }
}

class _SingleImageUploadState extends State<SingleImageUpload> {
  List<Object> images = List<Object>();
  Future<File> _imageFile;
  @override
  void initState() {
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      //  images.add("Add Image");
      // images.add("Add Image");
      // images.add("Add Image");
     // images.add("Add Image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildGridView();
  }

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index];
          return Card(
           // clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Image.file(
                  uploadModel.imageFile,
                  width: 200,
                  height: 200,
                ),
                Positioned(
                  right: 6,
                  top: 4,
                  child: InkWell(
                    child: CircleAvatar(
                      backgroundColor: Color(0xfffFF741A),
                      radius: 13,
                      child: IconButton(
                       icon: Icon(Icons.delete_outline,size: 12,),
                        color: Colors.white,
                        onPressed:() {
                      setState(() {
                        images.replaceRange(index, index + 1, ['Add Image']);
                      });
                    }, 
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Color(0xfffFF741A),
              ),
              onPressed: () {
                _onAddImageClick(index);
              },
            ),
          );
        }
      }),
    );
  }

  Future _onAddImageClick(int index) async {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
      getFileImage(index);
    //    final bytes = _imageFile.readAsBytesSync();
    // String _img64 = base64Encode(bytes);
    // print(_img64);
    // print("image");
    // print(imagepath);
    // setState(() {
    //   _image = imagepath;
    //   photopath = imagepath.toString();
    //   photo64 = _img64;
    // });
     });
  }

  void getFileImage(int index) async {
//   var dir = await path_provider.getTemporaryDirectory();

    _imageFile.then((file) async {
      setState(() {
        ImageUploadModel imageUpload = new ImageUploadModel();
        imageUpload.isUploaded = false;
        imageUpload.uploading = false;
        imageUpload.imageFile = file;
        imageUpload.imageUrl = '';
        images.replaceRange(index, index + 1, [imageUpload]);
      });
    });
  }
}

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}
