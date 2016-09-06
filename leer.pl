use Digest::MD5  qw(md5_hex);

my ($i, $archivo_final);

open (ARCHIVO,'/home/felipe/Downloads/Estados de cuenta PF/PDFTABLES/normal4.csv') || die "No se puede abrir el archivo\n";

while ($registro = <ARCHIVO>) { #lee linea por linea el archivo
    chop($registro); # quitamos el salto de linea
    @campo = split(";",$registro); #creamos arreglo de los valores separados por ;
    print "@campo\n";
    $archivo_final = "@campo\n";
    open(ARCHIVO_FINAL,">> salida.csv") || die "No se puede abrir el archivo\n";
    print ARCHIVO_FINAL $archivo_final."\n"; #Escribimos la linea que acabamos de armar en el archivo resultante
    $i++;
}

close(ARCHIVO);
print "\n\t Operación realizada Exitosamente. Se armaron $i registros\n";
