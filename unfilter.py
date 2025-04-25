# Importer le module QGIS
from qgis.core import QgsProject

# Obtenir le projet actif
projet = QgsProject.instance()

# Obtenir la liste des couches chargées dans le projet
couches = projet.mapLayers().values()

# Parcourir toutes les couches
for couche in couches:
    # Vérifier si la couche est une couche vectorielle
    if couche.type() == QgsMapLayer.VectorLayer:
        # Supprimer le filtre de la couche
        couche.setSubsetString('')
        print(f"Filtre supprimé pour la couche {couche.name()}")
