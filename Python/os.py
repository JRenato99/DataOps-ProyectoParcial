import os
#### Descargar dataset ###        
from kaggle.api.kaggle_api_extended import KaggleApi

###### Carpeta dataset #######
location = "C:/Users/jrsol/OneDrive/Escritorio/Proyecto_parcial/dataset"

###### Validar si la carpeta existe ############
if not os.path.exists(location):
    #Crear carpeta
    os.mkdir(location)
else: #si existe la carpeta
    ##borramos contenido
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root, name)) ##Eliminar archivos
        for name in dirs:
            os.rmdir(os.path.join(root, name)) ##Eliminar carpetas
        

## Autenticarnos ###
api = KaggleApi()
api.authenticate()

print(api.dataset_list(search=''))

api.dataset_download_files('youssefismail20/olympic-games-1994-2024', path = location, force = True, quiet = False, unzip = True)

