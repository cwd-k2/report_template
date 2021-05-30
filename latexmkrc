#!/usr/bin/env perl

$pdf_mode = 1;
$pdflatex = 'lualatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode %O %S';
$bibtex   = 'pbibtex %O %B';

$aux_dir  = "./build";
$out_dir  = "./build";

$pvc_view_file_via_temporary = 0;

$pdf_previewer = "echo %S";
