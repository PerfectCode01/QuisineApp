// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:quisine/pages/panier/panier_widget.dart';

import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class ProdMen extends StatefulWidget {
  const ProdMen({
    super.key,
    this.width,
    this.height,
    required this.menu,
  });

  final double? width;
  final double? height;
  final dynamic menu;

  @override
  State<ProdMen> createState() => _ProdMenState();
}

class _ProdMenState extends State<ProdMen> {
  final ScrollController _scrollController = ScrollController();
  bool _showContainer = false;
  late Future<List<dynamic>> futureCatalogs;
  late Future<List<dynamic>> futureproducts;
  List<dynamic> productsss = [];

  Map<int, GlobalKey> sectionKeys =
      {}; // Stocke les GlobalKey pour chaque section

  // ValueNotifier<List<Product>> panierlist = ValueNotifier([]);

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 40 && !_showContainer) {
        setState(() {
          _showContainer = true;
        });
      } else if (_scrollController.offset <= 40 && _showContainer) {
        setState(() {
          _showContainer = false;
        });
      }
    });

    futureCatalogs = fetchCatalogs();
    futureproducts = fetchproducts();
  }

  // Fonction pour naviguer vers une section
  void _scrollToSection(int index) {
    final key = sectionKeys[index];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // fonction catalog api
  Future<List<dynamic>> fetchCatalogs() async {
    final response = await http.get(Uri.parse(
        'https://test.systematik.tech/api/catalogs/${widget.menu['id']}'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erreur lors du chargement des données');
    }
  }

  Future<List<dynamic>> fetchproducts() async {
    final response = await http.get(Uri.parse(
        'https://test.systematik.tech/api/products/${FFAppState().selectedCityId}'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erreur lors du chargement des données');
    }
  }

// complete Products
  Widget completeProductfunction(completeProducts) {
    completeProducts = true; // Effectuer l'affectation ici
    return SizedBox.shrink(); // Ne retourne rien visuellement
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
        future:
            Future.wait([futureCatalogs, futureproducts]), // Future à exécuter
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerMenuPage(); // Affichage du chargement
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text("Erreur: ${snapshot.error}")); // Gestion des erreurs
          } else if (snapshot.hasData) {
            List<dynamic> catalogs =
                snapshot.data![0]; // Les données des catalogs
            List<dynamic> pdGeneral =
                snapshot.data![1]; // Les données des products
            // List<dynamic> catalogs = snapshot.data!;
            return DefaultTabController(
                length: catalogs.length,
                child: Stack(
                  children: [
                    // Positionner le bouton 'Retour' en haut à gauche
                    Container(
                      child: Stack(children: [
                        Padding(
                          child: Container(
                            child: Expanded(
                                child: ListView(
                              children: [
                                Padding(
                                    child: Container(
                                      child: ListView(
                                          controller:
                                              _scrollController, // Attacher le controller ici

                                          shrinkWrap:
                                              true, // Cette option permet au ListView de ne pas prendre toute la hauteur disponible
                                          // physics:
                                          //     NeverScrollableScrollPhysics(), // Désactive le défilement interne
                                          children: catalogs.map((catalog) {
                                            productsss = pdGeneral
                                                .where((pd) =>
                                                    pd['menu_id'] ==
                                                        widget.menu['id'] &&
                                                    pd['catalogs_id'] ==
                                                        catalog['id'])
                                                .toList();

                                            return Container(
                                                child: Column(children: [
                                              ListTile(
                                                  title: Text(catalog['name'],
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .w600))),
                                              GridView.count(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap:
                                                    true, // Permet à la GridView de ne pas prendre toute la hauteur disponible
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 6,
                                                mainAxisSpacing: 6,
                                                childAspectRatio: 0.7,
                                                children: List.generate(
                                                  productsss.length,
                                                  (index) => Card(
                                                    elevation:
                                                        0, // Désactive l'ombre

                                                    child: LayoutBuilder(
                                                      builder: (context,
                                                          constraints) {
                                                        return Column(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                // Image en arrière-plan
                                                                SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  height: constraints
                                                                          .maxHeight *
                                                                      0.7,
                                                                  child: Image
                                                                      .network(
                                                                    productsss[
                                                                            index]
                                                                        [
                                                                        'image'],
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                // Overlay noir transparent
                                                                SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  height: constraints
                                                                          .maxHeight *
                                                                      0.68,
                                                                  child:
                                                                      DecoratedBox(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FFAppState().panier.contains(productsss[
                                                                              index])
                                                                          ? Colors.red.withOpacity(
                                                                              0.2)
                                                                          : Colors
                                                                              .black
                                                                              .withOpacity(0.2),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20), // Coins arrondis
                                                                    ),
                                                                  ),
                                                                ),
                                                                // Bouton circulaire positionné en bas à droite
                                                                FFAppState()
                                                                        .panier
                                                                        .contains(productsss[
                                                                            index])
                                                                    ? Positioned(
                                                                        bottom:
                                                                            6,
                                                                        right:
                                                                            3, // Distance depuis la droite
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40, // Taille du cercle
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          child:
                                                                              IconButton(
                                                                            icon: Icon(Icons.remove,
                                                                                color: Colors.red,
                                                                                size: 24), // Icône "-"
                                                                            onPressed:
                                                                                () {
                                                                              FFAppState().panier.remove(productsss[index]);
                                                                              FFAppState().update(() {}); // Notifie FlutterFlow pour la mise à jour
                                                                            },
                                                                          ),
                                                                        ))
                                                                    : Positioned(
                                                                        bottom:
                                                                            6, // Distance depuis le bas
                                                                        right:
                                                                            3, // Distance depuis la droite
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40, // Taille du cercle
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          child:
                                                                              IconButton(
                                                                            icon: Icon(Icons.add,
                                                                                color: Colors.red,
                                                                                size: 24), // Icône "+"
                                                                            onPressed:
                                                                                () {
                                                                              FFAppState().panier.add(productsss[index]);
                                                                              FFAppState().update(() {}); // Notifie FlutterFlow pour la mise à jour
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start, // Aligne les enfants à gauche
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start, // Centre les enfants verticalement

                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft, // S'assurer que le texte est bien à gauche

                                                                    child: Text(
                                                                      productsss[index]
                                                                              [
                                                                              'nom'] ??
                                                                          'hjh',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft, // S'assurer que le texte est bien à gauche
                                                                      child: RichText(
                                                                          text: TextSpan(
                                                                              children: [
                                                                            TextSpan(text: productsss[index]['prix'])
                                                                          ]))),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]));
                                          }).toList()),
                                    ),
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10))
                              ],
                            )),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                    50), // Coin supérieur droit arrondi
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(
                              top: 100.0), // Adds 20px padding on top
                        )
                      ]),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1606787366850-de6330128bfc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8Zm9vZHN8ZW58MHx8fHwxNzQxMDg4Njg3fDA&ixlib=rb-4.0.3&q=80&w=1080'),
                          fit: BoxFit
                              .cover, // Ajuste l'image pour couvrir tout le container
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: _showContainer ? 1.0 : 0.0,
                        child: Container(
                          height:
                              140, // Hauteur ajustée pour contenir le TextField et la TabBar
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, // Centre horizontalement
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, // Centre verticalement
                                      children: [
                                        Text(
                                            widget.menu['name'] ??
                                                'erreur de chargerment',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold)),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .red[800], // Couleur de fond
                                            borderRadius: BorderRadius.circular(
                                                10), // Coins arrondis
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text('15-30 min',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        )
                                      ]),
                                  padding:
                                      EdgeInsets.only(left: 20, right: 20)),
                              SizedBox(height: 10), // Espacement
                              TabBar(
                                labelColor: Colors.red[800],
                                unselectedLabelColor: Colors.grey,
                                indicatorColor: Colors.red[800],
                                tabs: catalogs
                                    .map((catalog) => Tab(
                                          text: catalog[
                                              'name'], // Pas besoin de `.toString()`
                                        ))
                                    .toList(),
                                onTap: (index) {
                                  _scrollToSection(index);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          } else {
            return Center(child: Text("Aucune donnée disponible"));
          }
        },
      ),
    );
  }
}

class ShimmerMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Première barre (titre)
          _buildShimmerContainer(height: 20, width: double.infinity),
          SizedBox(height: 10),
          // Deuxième barre (sous-titre)
          _buildShimmerContainer(height: 15, width: 200),
          SizedBox(height: 20),
          // Grand rectangle (bannière)
          _buildShimmerContainer(height: 120, width: double.infinity),
          SizedBox(height: 20),

          // Grille de 2 colonnes
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Nombre de colonnes
              crossAxisSpacing: 10, // Espace horizontal entre les éléments
              mainAxisSpacing: 10, // Espace vertical entre les éléments
              childAspectRatio: 0.8, // Ajustement du ratio largeur/hauteur
            ),
            itemCount: 4, // Nombre total d'éléments
            itemBuilder: (context, index) {
              return _buildShimmerContainer(
                height: 140,
                width: (MediaQuery.of(context).size.width / 2) - 20,
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget réutilisable pour le shimmer
  Widget _buildShimmerContainer(
      {required double height, required double width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
