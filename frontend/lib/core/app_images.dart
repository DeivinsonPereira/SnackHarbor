import 'package:flutter/material.dart';
import 'package:frontend/repositories/category_repository.dart';

Widget buildImage() {
  return FutureBuilder<List<dynamic>>(
      future: getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error: Unable to load the image.'),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final String imgUrl = snapshot.data![index]['imgUrl'];
                return Image.network(imgUrl);
              });
        }
        return const Text('Imagem não encontrada');
      },
    );
}

Widget buildName() {
  return FutureBuilder<List<dynamic>>(
      future: getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error: Unable to load the image.'),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final String name = snapshot.data![index]['name'];
                return Text(name);
              });
        }
        return const Text('Imagem não encontrada');
      },
    );
}


