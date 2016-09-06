#!/usr/bin/perl -w

use strict;
use Spreadsheet::ParseExcel;

my $file = $ARGV[0] or die "se necesita un archivo";
my $parser   = Spreadsheet::ParseExcel->new();
my $workbook = $parser->parse($file);
my $archivo_final;
if ( !defined $workbook ) {
    die $parser->error(), ".\n";
}

for my $worksheet ( $workbook->worksheets() ) {

    my ( $row_min, $row_max ) = $worksheet->row_range();
    my ( $col_min, $col_max ) = $worksheet->col_range();

    for my $row ( $row_min .. $row_max ) {
        for my $col ( $col_min .. $col_max ) {

            my $cell = $worksheet->get_cell( $row, $col );
            next unless $cell;

            #my $ex = $worksheet->get_cell()
            print "Row, Col    = ($row, $col)\n";
            print "Value       = ", $cell->value(),       "\n";
            #print "Unformatted = ", $cell->unformatted(), "\n";
            print "\n";
            #open(ARCHIVO_FINAL,">> declaracion.txt") || die "No se puede abrir el archivo\n";
            #print ARCHIVO_FINAL $cell->value()."\t";
        }
    }
}
