import 'package:burc_projesi/burc_detay.dart';
import 'package:burc_projesi/model/burc.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BurcDetay(secilenBurc: listelenenBurc),
                ),
              );
            },
            leading: Image.asset('images/' + listelenenBurc.burcKucukResim),
            title: Text(
              listelenenBurc.burcAdi,
              style: myTextStyle.headline5,
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: myTextStyle.subtitle1,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
              size: 31,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
