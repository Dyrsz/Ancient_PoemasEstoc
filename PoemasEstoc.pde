/*   Hago vectores que me sirvan de bases de datos.
  1. Archivos txt de sustantivos, adjetivos, determinantes, pronombres, adverbios, interjecciones... separados todos por sílabas.
    1.1. Sustantivos todos en masculino y singular. Programar cambios de tiempo -Esto es para los adjetivos-.
    Nomenclatura: m f n (masculino, femenino, neutro) s p (singular, plural).
      1.1.1. Termina en vocal. +s plural.
      1.1.2. Termina en consonante. +es plural.
      1.1.3. Diminutivos, superlativos (?).
  2. Script que identifique la acentuación y la cadencia de los versos.
    2.1. Identifica la sílaba acentuada y el lugar en la palabra.
    2.2. Cuidado con los hiatos y diptongos.
  3. Otro para la rima. Rimas cruzadas, rimas después de comas.
  4. Archivos también de campos léxicos.
  5. Algoritmos para introducir recursos retóricos: aliteraciones, paralelismos...
  6. La idea es introducir un poema conocido, y que el programa imite la cadencia y el tipo de palabras.
*/

// Al cambiar de número o género, hacer un función que repase la acentuación.

// Para la rima, una función EncontrarTónica. Luego otra función con las sílabas (o vocales) a partir de la tónica.

String[] sustantivos;  // Tengo 103.
String[] adjetivos;    // Tengo 201.
//String[][] sustSib;

void setup() {
  size(800,600);
  background(0);
  sustantivos = loadStrings("Sustantivos.txt");
  adjetivos = loadStrings("Adjetivos.txt");
  /*
  String[][] sustSib = new String[sustantivos.length][];
  for (int i = 0; i < sustantivos.length; i++) sustSib[i] = split(sustantivos[i], '-');
  */
  //LocalizaRepetidos("Adjetivos");
  //IdentificaPropiedades("Adjetivos");
  IdentificaPropiedades("Adjetivos", byte(1));
}

  /*
  String [] identProp;
  identProp = loadStrings(nombreArchivo + ".txt");
  String[][] idProSib = new String[identProp.length][];
  for (int i = 0; i < identProp.length; i++) {
  idProSib[i] = split(identProp[i], '-');
  */
  


/*  Metodo VocalesUltimaSilaba

    char[] voc = VocalesUltimaSilaba(Palabra(identProp[i]));
    String vocS = "";
    for (int j = 0; j < voc.length; j++) vocS = vocS + voc[j] + " ";
    vocS = trim(vocS);
    identProp[i] = identProp[i] + " " + vocS;
*/