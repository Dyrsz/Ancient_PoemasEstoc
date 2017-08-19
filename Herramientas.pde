// A parte del void LocalizaRepetidos voy a hacerme una función que devuelva un txt con los repetidos eliminados y otro txt con los repetidos que ha eliminado.

void LocalizaRepetidos (String nombreArchivo) {
  String [] buscoRep;
  buscoRep = loadStrings(nombreArchivo + ".txt");
  int l = buscoRep.length;
  String[][] br = new String[l][];
  for (int i = 0; i < l; i++) br[i] = split(buscoRep[i], ' ');
  int[] vi = new int[l];
  for (int i = 0; i < l; i++) {
    if (vi[i] == 0) vi[i] = 1;
    if (vi[i] == 1) {
      for (int j = i; j < l-1; j++) if (br[i][0].equals(br[j+1][0])) vi[i]++;
      for (int j = i; j < l-1; j++) if (br[i][0].equals(br[j+1][0])) vi[j+1] = vi[i];
    }
  }
  int M = max(vi);
  int n = 0; // Cuenta el número de palabras repetidas.
  int m = 0; // Variable de apoyo.
  for (int i = 2; i <= M; i++) {
    m = 0;
    for (int j = 0; j < l; j++) if (vi[j] == i) m++;
    n += (m/i);
  }
  String[] sustEq = new String[n];
  int[][] sustEqI = new int[n][M];
  n = 0;
  for (int i = 0; i < l; i++) {
    if (vi[i] > 1) {
      sustEq[n] = br[i][0];
      sustEqI[n][0] = i;
      m = 1;
      for (int j = i; j < l-1; j++) {
        if (br[i][0].equals(br[j+1][0])) {
          sustEqI[n][m] = j+1;
          vi[j+1] = 1;
          m++;
        }
      }
      n++;
    }
  }
  for (int i = 0; i < n; i++) {
    sustEq[i] = sustEq[i] + " en ";
    for (m = 0; m < M; m++) {
      if (sustEqI[i][m] != 0) {
        if (m < M-1) {
          if (sustEqI[i][m+1] == 0) {
            sustEq[i] = sustEq[i] + str(sustEqI[i][m]+1) + ".";
          } else {
            sustEq[i] = sustEq[i] + str(sustEqI[i][m]+1) + ", ";
          }
        } else {
          sustEq[i] = sustEq[i] + str(sustEqI[i][m]+1) + ".";
        }
      }
    }
  }
  saveStrings(nombreArchivo + "Repetidos.txt", sustEq);
}

String FPalabra(String linea) {
  String[] p;
  p = split(linea,' ');
  return p[0];
}

String[] FSilabas(String linea) {
  String[] p;
  p = split(linea,' ');
  String[] sal;
  sal = split(p[0],'-');
  return sal;
}

char[] VocalesUltimaSilaba(String[] palabra) {
  String ultSil = palabra[palabra.length-1];
  int l = ultSil.length();
  char[] unids = new char[l];
  int n = 0;
  for (int i = 0; i < l; i++) {
    unids[i] = ultSil.charAt(i);
    if ((unids[i] == 'a' || unids[i] == 'e' || unids[i] == 'i' || unids[i] == 'o' || unids[i] == 'u') ||
    (unids[i] == 'á' || unids[i] == 'é' || unids[i] == 'í' || unids[i] == 'ó' || unids[i] == 'ú')) n++;
  }
  char[] sal = new char[n];
  n = 0;
  for (int i = 0; i < l; i++) if ((unids[i] == 'a' || unids[i] == 'e' || unids[i] == 'i' || unids[i] == 'o' || unids[i] == 'u') ||
  (unids[i] == 'á' || unids[i] == 'é' || unids[i] == 'í' || unids[i] == 'ó' || unids[i] == 'ú')) {
    sal[n] = unids[i];
    n++;
  }
  return sal;
}

void IdentificaPropiedades (String nombreArchivo, byte tipo) {
  
  /*
    Tipo:
      0: Sustantivos.
      1: Adjetivos.
  
  Nomenclatura: m f n (masculino, femenino, neutro) s p (singular, plural).
  
  - Esto me da una guía que luego tendría que repasar manualmente. Los n todos manuales.
  - Primero el género:
    - Los n los pongo manualmente.
    - La última letra de cada palabra es una 'a': femenino. Si no, masculino.
    - Si es adjetivo y termina en 'e', neutro.
  - Número:
    - Última letra distinta de 's': singular. Si no, plural.  
  */
  
  String [] identProp;
  identProp = loadStrings(nombreArchivo + ".txt");
  for (int i = 0; i < identProp.length; i++) {
    if (identProp[i].charAt(identProp[i].length()-1) == 'a' || identProp[i].charAt(identProp[i].length()-1) == 'á') {
      identProp[i] = identProp[i] + " f";
    } else if (tipo == 1 && identProp[i].charAt(identProp[i].length()-1) == 'e') { 
      identProp[i] = identProp[i] + " n";
    } else {
      identProp[i] = identProp[i] + " m";
    }
    if (identProp[i].charAt(identProp[i].length()-1) == 's') {
      identProp[i] = identProp[i] + " p";
    } else {
      identProp[i] = identProp[i] + " s";
    }
  }
  saveStrings(nombreArchivo + "PropiedadesIdentificadas.txt", identProp);
}

void EliminaPropiedades(String nombreArchivo) {
  String [] elimProp;
  elimProp = loadStrings(nombreArchivo + ".txt");
  String [] sal = new String [elimProp.length];
  for (int i = 0; i < elimProp.length; i++) sal[i] = FPalabra(elimProp[i]);
  saveStrings(nombreArchivo + "SinPropiedades.txt", sal);
}