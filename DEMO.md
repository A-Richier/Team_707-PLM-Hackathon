# Fil conducteur de la démo (environ 6 minutes)

Contexte à dire en ouverture : E-Motion Drive Systems assemble en France le groupe motopropulseur électrique
avant 410 kW du constructeur ECAR. Nous ne recevons qu'un export XML de son PLM. Le tableau de bord le
transforme en outil de pilotage : structure produit, suivi fournisseurs, analyse coût et risque.
Les données fournisseurs, prix et pays sont simulées. La structure, les masses, les matériaux et les révisions
viennent de l'export.

## 1. Structure produit (1 min 30)

- Bandeau : 410 kW eDrive, révision D, IN_WORK, 100,1 kg, 38 références et 70 pièces, coût de revient 2 055 €.
- Nomenclature : déplier EMOTOR, puis STATOR. Montrer les pastilles de criticité (vert, orange, rouge) et
  les colonnes matériau, fournisseur et coût sur chaque ligne.
- Propriétés : STATOR Coils, avec son ID PLM, sa révision B, 7,2 kg de cuivre, son fournisseur américain,
  son alternative allemande et une criticité de 60/100.
- Contrôles de l'export : aucune pièce diffusée, pas de rotor, composants homonymes, masses cohérentes.

À dire : « On reconstruit la nomenclature à partir des liens parent-enfant du XML et on y rattache le
sourcing par ID PLM. »

## 2. Analyse par pays (1 min 30)

- Ouvrir « Analyse par pays » et sélectionner la Chine pour montrer les composants de plusieurs fournisseurs
  exposés au même pays, ainsi que leurs parents et leurs quantités.
- Expliquer qu'une crise dans ce pays peut toucher plusieurs composants simultanément.
- Passer dans « Détail fournisseurs » pour approfondir les performances individuelles.

- Sélectionner Pune Gear Works : performances, site, certifications, ESG 48, réponse en 20 h.
- Connexions produit : 9 références, toutes dans le réducteur, soit 10,8 M€ d'achats par an.
- Barres ESG et temps de réponse : Pune est mis en évidence parmi les 14 fournisseurs.
- Pièces nominées : GEAR WHEEL rév. D chargée à 97 % de la capacité allouée (en rouge).
- Sélectionner Kansai Precision Bearings : les 7 roulements proviennent du même fournisseur.

À dire : « Dans le XML, il n'y a que des liens parent-enfant. Les vraies dépendances apparaissent quand on
relie chaque pièce à son fournisseur, à son pays et à sa capacité. »

## 3. Analyse coût et risque (2 min 30)

- Montrer le classement des composants réutilisés : trier par parents directs, puis par instances père–fils.
  Distinguer les quantités locales et les quantités totales dans le produit.
- Sans risque sélectionné : coût matière +422 k€ sur 12 mois, prévision +160 k€.
- Gestion des risques, onglet Synthèse : la matrice probabilité × impact.
- Onglet Risques : sélectionner R-0001 (droits de douane +20 % sur le cuivre américain).
  - La prévision IF passe à +694 k€. La courbe Total IF décroche à partir de décembre.
  - Fiche du risque : surcoût de 17,80 € par unité, −534 k€ par an, marge de 17,5 % à 16,7 %.
  - Pièces les plus impactées : STATOR Coils (+17,80 €). Le prix passe de 89 € à 106,80 € en IF.
  - Encadré du bas : la bascule vers Elektrodraht Nord est rentable (+294 k€ par an) et le délai passe de 10 à 4 semaines.
- Sélectionner R-0002 (restriction chinoise sur l'acier électrique), puis le périmètre EMOTOR FRONT :
  STATOR Core en tête. Ici, la bascule vers le fournisseur suédois coûte plus cher : c'est un arbitrage entre
  coût et sécurité d'approvisionnement.

À dire : « Chaque risque du registre est relié à un scénario chiffré. On voit l'impact sur le coût, la marge
et les délais, et l'action possible pièce par pièce. »

## Conclusion (30 s)

À partir d'un simple export XML, on obtient trois vues métier traçables jusqu'à l'ID PLM. Suites possibles :
brancher de vrais prix et fournisseurs, recevoir des exports avec paramètres PLM et historique des révisions,
ajouter un assistant en langage naturel qui cite ses sources.

## Questions probables

| Question | Réponse |
|---|---|
| Les prix sont-ils réels ? | Non, ils sont simulés mais plausibles, dans data/business/*.csv. La méthode reste valable avec des données réelles. |
| Comment est calculé le prix IF ? | Le choc s'applique à la part matière (cours) ou au prix d'achat (droits de douane), à partir du 2e mois de prévision. |
| La criticité ? | Score sur 100 : poids dans le coût, risque pays, source unique, concentration pays, délai, matière critique. |
| Pourquoi pas de 3D ? | L'export ne contient aucun fichier CAO (WithFiles = No). |

## Checklist

- Lancer l'application avant l'oral (`.\demarrer.bat` depuis `C:\Users\cyril\ecar_plm_app_v2\ecar_plm_app`).
- Navigateur en plein écran, zoom à 80 ou 90 % sur un petit écran.
- Connexion Internet pour la carte de l'onglet Sites.
- Désélectionner le risque avant de commencer.
