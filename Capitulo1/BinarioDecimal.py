import numpy as np
import pandas as pd


def DecodificarBinario(binario):
    '''
    Funcion que tranforma un numero binario de n bits
    al sistema decimal. 
    
    Parameters
    ----------
    binario : str
        Numero binario de n bits.

    Returns
    -------
    decimal: int
    Numero entero decimal
    '''
    #Conversion del binario a un vector de numeros enteros
    binario = np.array(list(binario) , dtype = int )[::-1]
    
    #Generación de la serie de potencias de base 2
    potencias = np.array([2**n for n in range(len(binario))])
    
    #Multiplicación de vectores y suma de producto para dar como resultado el equivalente decimal.
    decimal = sum(binario * potencias)
    
    return decimal


def RecorridoComa(exponente):
    '''
    Numero binario que, luego de ser convertido a decimal y disminuido en 127, revela
    el numero de espacios que ha reccorrido la coma de un numero decimal no entero. 

    Parameters
    ----------
    exponente : str
        Numero binario que encripta el exponente

    Returns
    -------
    Espacios: int
    Numero de espacios que ha recorrido la coma
    '''
    
    Espacios = DecodificarBinario(exponente) - 127
    
    return Espacios


def PartirMantisa(mantisa,exponente):
    '''
    Funcion que determina los binarios que representan
    la parte entera y decimal de un numero en base 10

    Parameters
    ----------
    Mantisa : str
        Mantisa de la codificacion a IEEE 754
    EspaciosComa : int
        Espacios que determinan la cantidad de bits
        que representan la parte entera.

    Returns
    -------
    ParteEntera : str
        Parte de la mantisa que representa la parte entera
        
    ParteDecimal : str
        Parte de la mantisa que representa la parte decimal
    '''
    #Determinacion de la cantidad de espacion que recorrio la coma
    EspaciosComa = RecorridoComa(exponente)
    
    #Eliminacion de ceros de la mantisa. Tomamos los valores, 0's o 1's, que rellenaban la mantisa
    mantisa = '1' + mantisa[:mantisa.rfind('1') + 1]
    
    #Particion de la mantisa en binario de parte entera y binario de parte decimal
    ParteEntera  = mantisa[:EspaciosComa + 1]
    ParteDecimal = mantisa[EspaciosComa + 1:]
    
    return ParteEntera, ParteDecimal
    

def DecodificarBinarioDecimal(BinarioDecimal):
    '''
    Funcion que transforma al sistema decimal la parte
    decimal de un numero codificado a binario

    Parameters
    ----------
    BinarioDecimal : str
        Binario que encripta la parte decimal

    Returns
    -------
    ParteDecimal = int
    Binario transformado
    '''
    
    BinarioDecimal = np.array(list(BinarioDecimal), dtype = int)
    
    #Generacion de potencias de base 5
    potencias_5 = np.array([5**n for n in range(1, len(BinarioDecimal) + 1)])
    
    #Generacion de potencias de base 10
    potencias_10 = np.array([10**n for n in range(len(BinarioDecimal), 0, -1)])
    
    ParteDecimal = sum(BinarioDecimal * potencias_5 * potencias_10)
    
    return ParteDecimal


def TransformarBinarioDecimal(signo, exponente, mantisa):
    '''
    Funcion que decodifica un numero decimal no entero convertido
    a binario.

    Parameters
    ----------
    signo : int
        Valor (0 o 1) que determina el signo del decimal
    exponente : str
        Numero binario que encripta un decimal. Este decimal permite conocer 
        la cantidad de espacios que representan la parte entera y no entera
        del numero desconocido
    mantisa : str
        Numero binario que encripta la parte entera y no entera del numero
        desconocido
    
    Returns
    -------
    Decimal: str
    Numero decimal decodificado
    '''
    #Reconocimiento del signo
    if signo == '0':
        signo = '+'
    elif signo == '1':
        signo = '-'
    
    #Desempaquetado de la mantisa
    ParteEntera, ParteDecimal = PartirMantisa(mantisa, exponente)
    
    #Conversion a decimal de la parte entera y decimal    
    ParteEntera  = DecodificarBinario(ParteEntera)
    ParteDecimal = DecodificarBinarioDecimal(ParteDecimal)
    
    print('{:s}{:d},{:d}'.format(signo,ParteEntera, ParteDecimal))
    return ''


def TransformarBinarios(dataframe):
    '''
    Funcion que, dado un dataframe cuya columna contiene
    el signo, exponente y mantisa de numeros binarios, retorna 
    sus equivalentes decimales.
    
    Parameters
    ----------
    dataframe : pd.dataframe
        Dataframe con la informacion sobre los numeros binarios

    Returns
    -------
    decimales:list
        lista con los equivalentes decimales
    '''
    equivalentes = []
    
    for binario in dataframe.Binario:
        
        signo,exponente,mantisa = tuple(binario.split('-'))
        equivalente = TransformarBinarioDecimal(signo, exponente, mantisa)
        
        equivalentes += equivalente
    
    return equivalentes
    

data = pd.read_csv('Binarios.csv', sep = ';', index_col = 0)
print(TransformarBinarios(data))
