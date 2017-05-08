##Reglas Basicas

* Usar Github para cualquier actividad. Si lo que estas haciendo no esta en Github, quiere decir que no hay que hacerlo. Si lo que estas haciendo no esta en Github y necesitas hacerlo, crea un issue antes de hacerlo.

* Normalmente estaremos trabajando con una issue en especifico. Es importante para el equipo saber cual es. Coloca un label `in progress` en la issue que estes trabajando y cuando pases a otra, quitale ese label `in progress` y ponselo a la que estes trabajando actualmente.

* Cualquier actividad de Github, automaticamente se envia a Slack. Evita duplicar comentarios. Si quieres hacer un comentario sobre una issue en especifico, es preferible que lo comentes directamente en la issue, en lugar de hacerlo en Slack.

* El cliente tiene una cuenta en Github, asi que los comentarios de GH deben ser lo mas enfocados posibles.

* A menos que un miembro del equipo este explicitamente suscrito en una issue, tus comentarios no le llegaran a menos que lo menciones. Por ejemplo, para mencionar a alguien escribe `@` y GH te autocompletara el usuario. Dale `ENTER` al seleccionarlo. `@mauleyzaola` es un ejemplo de mencionar a alguien en un comentario.

* Si quieres hacer referencia a una issue dentro de otra, utiliza `#` seguido del numero de issue. Por ejemplo, para hacer referencia a la issue 100, escribe `#100` 

##Checkout
Primero, vamos a actualizar los ultimos cambios del branch master
```
git checkout master
git pull
```

A continuacion, vamos a crear nuestro branch para trabajar en la issue
```
git checkout -b issue/<numero de issue>
```

##Progreso

Es importante que todos los avances sean enviados a GH, al menos una vez al dia. Esto es asi por varios motivos:

1. Evitar perder informacion.

2. Posibilidad de que alguien mas revise tu avance.

3. Posibilidad de que alguien mas prueba tu avance.

##Branches

Cualquier issue que resuelvas debe tener commits a un branch especifico. Nunca hagas commits directos al master por favor.

El nombre del branch sera con la sintaxis `issue/<numero de issue>`, donde el numero es el numero de la issue que aparece en la URL de Github.

El flujo para subir codigo al repositorio es:

```
git add --all
git commit -m "<comentario del commit>"
git push origin <nombre del branch>
```

El `<comentario del commit>` siempre tiene que hacer referencia al issue que esta relacionado con el. Utiliza lenguaje en ingles para los comentarios. Los siguientes son comentarios comunes:

```
wip #100
fixes #100
resolves #100
```

Si utilizas la palabra `fixes` o `resolves` seguido del numero de issue, GH va a asumir que ese commit esta resolviendo la issue y cuando se haga merge de tu codigo con el master, ese issue se resolvera automaticamente.

##Pull Requests

Es valido que sobre un branch hagas uno o mas commits. Una vez que estes seguro que tu issue esta resuelta o bien, si requieres que alguien mas del equipo valide tu progreso, entonces es necesario crear un Pull Request.

El Pull Request esta ligado al branch donde estes trabajando. Es importante que el PR contenga los cambios necesarios para resolver un issue.

Procura no hacer PR demasiado ambiciosos porque sera mas complicado de integrar con el repositorio y porque sera tambien, mas complicado de revisar y probar para otros miembros del equipo.

En el nombre del PR intenta colocar un resumen del nombre de la issue, ademas del numero al que hace referencia. No coloques unicamente el numero de la issue que esta relacionada porque sera mas complicado para temas de trazabilidad.

Esto es un ejemplo de un PR con una buena descripcion:

![Ejemplo PR](https://cloud.githubusercontent.com/assets/1648558/14404071/d99caade-fe33-11e5-8236-0224b2c9bc15.png)

Una vez que hayas creado tu PR, se genera un numero de issue. Despues de todo un PR es otra issue mas de GH. Haz referencia al numero de issue del PR desde tu issue original que estes resolviendo. Esto creara una referencia visual muy clara entre ambos.

Coloca un comentario en tu issue con esta sintaxis:
```
PR: #101
```
Donde `101` es el numero de la issue del PR. Este numero lo puedes ver en la URL del PR al momento que lo has guardado

Por ultimo, para solicitar que alguien mas revise tu trabajo en el PR, sera necesario que lo asignes como responsable, como cualquier otra issue.

##Merge un PR

Todos los PR deben pasar por un proceso de revision por parte de otro miembro del equipo. Una vez que dicha revision ha sido efectuada, es posible que haya anotaciones en tu codigo, sobre el propio PR o anotaciones en el issue relacionado.

Por favor no hagas merge por tu cuenta sin haber pasado por ese proceso de revision, a menos que asi se haya indicado explicitamente.

Si no es posible hacer merge porque tu codigo tiene conflictos, sera tu responsabilidad resolver estos conflictos hasta que sea posible hacer un merge.

##Despues del merge

Si se ha hecho merge de tu codigo, entonces por favor:

1. Elimina el branch, ya no tiene sentido que exista en el repositorio

2. Asegurate que la issue relacionada con tu PR este resuelta, si no se resolvio por medio de los comentarios, hazlo de forma manual.
