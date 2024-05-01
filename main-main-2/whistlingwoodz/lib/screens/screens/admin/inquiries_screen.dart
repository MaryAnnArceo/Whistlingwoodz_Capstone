import 'package:flutter/material.dart';

// This is a inquiry list screen.
// And this screen is used to show all inquiries from the customer.
// But, it has only front-end part. There is no back-end developed.  (It hasn't developed due to the time issue.)
class InquiryList extends StatefulWidget {
  const InquiryList({super.key});

  @override
  State<InquiryList> createState() => _InquiryListState();
}

class _InquiryListState extends State<InquiryList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 225, 225, 225),
              // gradient: RadialGradient(colors: colors),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // inquiry table design
                children: [
                  DataTable(
                      headingTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      columnSpacing: Checkbox.width,
                      columns: const [
                        DataColumn(label: (Text("ID"))),
                        DataColumn(label: (Text("Name"))),
                        DataColumn(label: (Text("Type"))),
                        DataColumn(label: (Text("Status"))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Jin")),
                          DataCell(Text("Wedding")),
                          DataCell(Text("New")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("2")),
                          DataCell(Text("Adam")),
                          DataCell(Text("Corporate")),
                          DataCell(Text("New")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("3")),
                          DataCell(Text("Brandon")),
                          DataCell(Text("Party")),
                          DataCell(Text("New")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("4")),
                          DataCell(Text("Simone")),
                          DataCell(Text("Wedding")),
                          DataCell(Text("New")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("5")),
                          DataCell(Text("Gavin")),
                          DataCell(Text("Corporate")),
                          DataCell(Text("Processing")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("6")),
                          DataCell(Text("Tom")),
                          DataCell(Text("Party")),
                          DataCell(Text("Processing")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("7")),
                          DataCell(Text("Max")),
                          DataCell(Text("Wedding")),
                          DataCell(Text("Processing")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("8")),
                          DataCell(Text("Ben")),
                          DataCell(Text("Wedding")),
                          DataCell(Text("Processing")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("9")),
                          DataCell(Text("John")),
                          DataCell(Text("Party")),
                          DataCell(Text("Processing")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("10")),
                          DataCell(Text("Jessica")),
                          DataCell(Text("Corporate")),
                          DataCell(Text("Processing")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("11")),
                          DataCell(Text("Julia")),
                          DataCell(Text("Wedding")),
                          DataCell(Text("Processing")),
                        ]),
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
