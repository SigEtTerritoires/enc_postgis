# Importer le module QGIS
from qgis.core import QgsProject, QgsMapLayerType

# Définir le valeur de l'attribut "purpose" à filtrer
valeur_purpose = 5

# Obtenir le projet actif
projet = QgsProject.instance()

# Obtenir la liste des couches chargées dans le projet
couches = projet.mapLayers().values()

# Parcourir toutes les couches
for couche in couches:
    # Vérifier si la couche est de type vecteur
    if couche.type() == QgsMapLayerType.VectorLayer:
        # Vérifier si la couche a un champ nommé "purpose"
        if couche.fields().indexFromName('purpose') != -1:
            # Vérifier si le nom de la couche commence par l'un des préfixes spécifiés
            if couche.name().startswith(('pt_', 'li_', 'pl_')):
                # Définir le filtre sur l'attribut "purpose" égal à la valeur spécifiée
                filtre = f'"purpose" = {valeur_purpose}'
                couche.setSubsetString(filtre)
                print(f"Filre défini pour la couche {couche.name()}")
            else:
                print(f"La couche {couche.name()} ne commence pas par 'pt_', 'li_', ou 'pl_'")
        else:
            print(f"La couche {couche.name()} n'a pas d'attribut 'purpose'")
    else:
        print(f"La couche {couche.name()} n'est pas une couche vecteur")
