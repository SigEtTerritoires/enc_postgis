# Récupérer la vue des couches
layer_tree_view = iface.layerTreeView()

# Récupérer les couches sélectionnées
selected_layers = layer_tree_view.selectedLayers()

# Définir l'échelle minimale pour chaque couche sélectionnée
for layer in selected_layers:
    # Définir l'échelle minimale (par exemple, 1:50000)
    min_scale = 250000
    
    # Définir l'échelle minimale d'affichage pour la couche
    layer.setScaleBasedVisibility(True)
    layer.setMinimumScale(min_scale)
    print(f"L'échelle d'affichage de la couche {layer.name()} a été définie sur {min_scale}.")
