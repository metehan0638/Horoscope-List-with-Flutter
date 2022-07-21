import 'package:burc_projesi/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.transparent;
  late PaletteGenerator generator;
  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          backgroundColor: appBarRengi,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(widget.secilenBurc.burcAdi + ' Burcu ve Özellikleri'),
            background: Image.asset(
                'images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.yellow.shade300,
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetayi,
                style: TextStyle(
                    backgroundColor: Colors.yellow.shade500,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    fontFamily: 'helvetica'),
              ),
            ),
          ),
        )
      ],
    ));
  }

  void appBarRenginiBul() async {
    generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/' + widget.secilenBurc.burcBuyukResim));
    appBarRengi = generator.dominantColor!.color;
    setState(() {});
  }
}
