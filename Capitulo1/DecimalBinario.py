import numpy  as np
import pandas as pd


def GenerarBinario(numero, Techo, LimiteBits):
    '''
    Funcion que toma la parte decimal de un numero
    en base 10 y retorna su codificacion en binario
    Parameters
    ----------
    numero : numpy array
        DESCRIPTION.
    Techo : int
        Techo que el numero toma como referencia para codificar 1's o 0's
    LimiteBits : int
        Limite de bits que puede ocupar la codificacion de la parte decimal

    Returns
    -------
    ParteDecimalBin : str
        Parte decimal codificada

    '''
    #Definicion del numero decimal a entero mediante potencias de 10
    numero = sum(numero * np.array([10**n for n in range(len(numero) - 1, -1, -1)]))  
    
    #Inicio de el producto y la parte decimal
    producto = 1
    ParteDecimalBin = ''
    
    while producto != Techo and len(ParteDecimalBin)!= LimiteBits:
        
        producto = numero * 2
        
        if producto < Techo:
            ParteDecimalBin += '0'
            numero = producto
        elif producto >= Techo:
            ParteDecimalBin += '1'
            numero = producto - Techo
        
    return ParteDecimalBin


def ObtenerBinarioDecimal(decimal,EnteroCodificado):
    '''
    Funcion que convierte la parte decimal de un numero en base 10
    a binario

    Parameters
    ----------
    decimal : str
        Parte decimal a ser transformarda
    EnteroCodificado: str
        Parte decimal del entero codificada a binario
    
    Returns
    -------
    ParteDecimalBin: str
        Decimal transfromada
    '''
    #Calculo del numero
    numero     = np.array(list(decimal), dtype = int) #Separacion en digitos
    #Techo que debe pasar el numero para tomar 0 o 1
    Techo      = 10**len(numero)
    #Limite de Bits que puede tomar el numero
    LimiteBits = 23 - len(EnteroCodificado[1:])
    
    ParteDecimalBin = GenerarBinario(numero, Techo, LimiteBits)
    
    return ParteDecimalBin
    
    
def CalcularExponente(ParteEntera):
    '''
    Funcion que retorna el exponente
    del numero decimal.

    Parameters
    ----------
    ParteEntera : str
        Conversion a binario del numero decimal

    Returns
    -------
    Exponente:str
        Exponente del numero decimal en binario

    '''
    exp = len(ParteEntera[1:]) + 127
    exp = bin(exp)[2:]
    
    return exp


def TransformarDecimalBinario(numero):
    '''
    Funcion que transforma un numero en base decimal
    a binario.

    Parameters
    ----------
    numero : str
        Numero a ser transformada

    Returns
    -------
    signo: int
        Signo del numero decimal
    exponente:str
        Exponente del numero decimal
    mantisa:str
        Mantisa del numero decimal

    '''
    signo = '0'
    if numero[0] == '-':
        signo = '1'
    #Division del numero en parte entera y decimal
    ParteEntera  = numero.split(',')[0]
    ParteDecimal = numero.split(',')[1]
    
    #Transformacion de la parte entera y decimal a binario
    ParteEntera  = bin(int(ParteEntera))[2:]
    ParteDecimal = ObtenerBinarioDecimal(ParteDecimal,ParteEntera)
    
    #Calculo del exponente
    exponente = CalcularExponente(ParteEntera)
    
    #Formacion de la mantisa
    mantisa = (ParteEntera[1:] + ParteDecimal).ljust(23,'0')
    
    return [signo,exponente,mantisa]

#Lectura de datos y paso a string
nums = pd.read_csv('DaB.csv', sep = ';', index_col = 0)
nums = np.array(nums.Numero, dtype = str)

print(*map(TransformarDecimalBinario,nums))