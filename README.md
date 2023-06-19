# MeLi-ChallengeDaniel

Este proyecto utiliza la Api de Mercado Libre para mostrar un listado de productos con base a una palabra previamente sacada de un TextField, 
Muestra un listado que al hacer click en uno de sus items manda a otra vista para mostrar su descripción del producto.

**IMPORTANTE**
-El servicio que se incorpora en la app solo obtiene los primeros 11 items que el endpoint de Mercado Libre arroja en su resultado, 
 de ser el caso que sean menos casos, arroja el total de resultados del endPoint.
-Solo se obtienen 5 datos esenciales tanto como para mostrar el listado, asi como para mostrar su Descripción,
los datos utilizados son:
  - Id del articulo (id)
  - Nombre (title)
  - Precio (price)
  - condición (condition)
  - imagen de muestra del producto (thumbnail)
