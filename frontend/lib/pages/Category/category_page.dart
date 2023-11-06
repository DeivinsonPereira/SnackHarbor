import 'package:flutter/material.dart';
import 'package:frontend/core/app_requisition.dart';
import 'package:frontend/core/app_textStyles.dart';
import 'package:frontend/pages/product/product_page.dart';

class CategoryPage extends StatelessWidget {
  final int tableId;
  const CategoryPage({super.key, required this.tableId});

  _buildCard(BuildContext context, String title, String image, int index) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductPage(
              tableId: tableId,
              categoryName: title,
              categoryId: index,
            ),
          ),
        );
      },
      child: Stack(children: [
        Container(
          width: 155,
          height: 155,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 3,
                bottom: 3,
              ),
              child: Center(
                child: Text(title, style: AppTextStyles.buttonTextWhite),
              ),
            ),
          ),
        )
      ]),
    );
  }

  _buildBody() {
    return FutureBuilder<List<dynamic>>(
      future: getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error: Unable to load data.'),
          );
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final String name = snapshot.data![index]['name'];
                final String imgUrl = snapshot.data![index]['imgUrl'];
                return _buildCard(context, name, imgUrl, index + 1);
              },
            ),
          );
        }
        return const Center(child: Text('Data not found'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Categorias | Mesa $tableId',
          style: AppTextStyles.buttonTextOrange,
        ),
      ),
      body: _buildBody(),
    );
  }
}
