import 'package:custom_container1/widgets/dropdown_row.dart';
import 'package:custom_container1/widgets/style_button.dart';
import 'package:custom_container1/widgets/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBasicExpanded = true; // Manage basic state
  bool isTypographyExpanded = true; //manage typography state
  bool isButtonOptionsExpanded = false; //manage button options state
  int selectedTabIndex = 0; // Manage top navigation state
  String selectedAlignment = "Center";
  String selectedStyle = "Regular";

  final List<Map<String, dynamic>> basicItems = [
    {"icon": Symbols.imagesmode, "label": "Image"},
    {"icon": Symbols.video_call, "label": "Video"},
    {"icon": Icons.smart_button, "label": "Button"},
    {"icon": Symbols.gif_box, "label": "GIF"},
    {"icon": Symbols.attach_file_add, "label": "File"},
  ];

  final List<Map<String, dynamic>> typographyItems = [
    {"icon": Symbols.title, "label": "Title"},
    {"icon": Symbols.short_text, "label": "Text Block"},
    {"icon": Symbols.playlist_add, "label": "List"},
    {"icon": Symbols.format_quote, "label": "Quote"},
    {"icon": Symbols.link, "label": "Link"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 36, right: 8),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
              width: 280,
              // height: 440,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  // Top Navigation
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(18)),
                      child: Row(
                        children: [
                          TabItem(
                            label: 'Content',
                            icon: Symbols.content_copy,
                            index: 0,
                            onTap: (value) {
                              selectedTabIndex = value;
                              setState(() {});
                            },
                            selectedIndex: selectedTabIndex,
                          ),
                          const SizedBox(width: 16),
                          TabItem(
                            label: 'Rows',
                            icon: Symbols.view_list,
                            index: 1,
                            onTap: (value) {
                              selectedTabIndex = value;
                              setState(() {});
                            },
                            selectedIndex: selectedTabIndex,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Dropdown Menu
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Dropdown Header
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isBasicExpanded = !isBasicExpanded;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Basic",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(isBasicExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            if (isBasicExpanded)
                              GridView.builder(
                                padding: const EdgeInsets.only(top: 8),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                ),
                                itemCount: basicItems.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        width: 44,
                                        height: 44,
                                        child: Icon(
                                          basicItems[index]["icon"],
                                          size: 44,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        basicItems[index]["label"],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTypographyExpanded = !isTypographyExpanded;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Typography',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(isTypographyExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            if (isTypographyExpanded)
                              GridView.builder(
                                padding: const EdgeInsets.only(top: 8),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                ),
                                itemCount: basicItems.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        width: 44,
                                        height: 44,
                                        child: Icon(
                                          typographyItems[index]["icon"],
                                          size: 44,
                                          fill: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        typographyItems[index]["label"],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isButtonOptionsExpanded =
                                      !isButtonOptionsExpanded;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Button options',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(isButtonOptionsExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextField(
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 14)),
                                decoration: const InputDecoration(
                                    hintText: 'Enter text',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 5, left: 10)),
                              ),
                            ),
                            if (isButtonOptionsExpanded)
                              Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const DropdownRow(
                                    label: "Font",
                                    selectedValue: "Inter Tight",
                                    options: ["Inter Tight", "Roboto", "Arial"],
                                  ),
                                  const SizedBox(height: 10),
                                  const DropdownRow(
                                    label: "Weight",
                                    selectedValue: "500 - Bold",
                                    options: [
                                      "300 - Light",
                                      "400 - Regular",
                                      "500 - Bold"
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  buildOptionRow(
                                    "Size",
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 76.0),
                                          child: Container(
                                            width: 74, // Set your desired width
                                            height:
                                                38, // Set your desired height
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color: Colors.grey.shade200),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 4,
                                                  left: 8,
                                                  right: 8),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: TextField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType: TextInputType
                                                          .number, // Only allows numeric input
                                                      inputFormatters: <TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .digitsOnly, // Restricts input to digits only
                                                      ],
                                                      style: GoogleFonts.poppins(
                                                          fontSize:
                                                              14), // Decreases text size
                                                      // cursorHeight:
                                                      //     16, // Adjust cursor height to match the text size
                                                      cursorWidth: 1.5,
                                                      decoration:
                                                          const InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                          15),
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    child: Text(
                                                      'PX',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Align",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        width:
                                            150, // Fixed width for the dropdown button
                                        height:
                                            40, // Fixed height for the dropdown button
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            buildAlignmentButton(
                                                Icons.format_align_left,
                                                "Left"),
                                            buildAlignmentButton(
                                                Icons.format_align_center,
                                                "Center"),
                                            buildAlignmentButton(
                                                Icons.format_align_right,
                                                "Right"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Style",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 26,
                                      ),
                                      StyleButton(
                                        icon: Icons.format_italic,
                                        style: "Italic",
                                        isSelected: selectedStyle == 'Italic',
                                        onTap: () {
                                          setState(() {
                                            selectedStyle =
                                                selectedStyle == 'Italic'
                                                    ? 'Regular'
                                                    : 'Italic';
                                          });
                                        },
                                      ),
                                      StyleButton(
                                        icon: Icons.format_bold,
                                        style: "Bold",
                                        isSelected: selectedStyle == 'Bold',
                                        onTap: () {
                                          setState(() {
                                            selectedStyle =
                                                selectedStyle == 'Bold'
                                                    ? 'Regular'
                                                    : 'Bold';
                                          });
                                        },
                                      ),
                                      StyleButton(
                                        icon: Icons.format_underline,
                                        style: "Underline",
                                        isSelected:
                                            selectedStyle == 'Underline',
                                        onTap: () {
                                          setState(() {
                                            selectedStyle =
                                                selectedStyle == 'Underline'
                                                    ? 'Regular'
                                                    : 'Underline';
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget buildAlignmentButton(IconData icon, String align) {
    return SizedBox(
      width: 50,
      height: 38,
      child: IconButton(
        icon: Icon(icon, size: 18),
        color: selectedAlignment == align ? Colors.white : Colors.black,
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(selectedAlignment == align
                ? Colors.black
                : Colors.transparent)),
        onPressed: () {
          setState(() {
            selectedAlignment = align;
          });
        },
      ),
    );
  }
}

Widget buildOptionRow(String label, Widget widget) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
          )),
      Expanded(child: widget),
    ],
  );
}
