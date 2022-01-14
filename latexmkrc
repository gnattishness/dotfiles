$pdf_previewer = 'start zathura %O %S';
push @generated_exts, 'synctex.gz', 'synctex', 'thm', 'sp', 'listing', 'pyg';
$clean_ext = 'bbl';
# Specify twice to also delete the folder
$clean_full_ext = '_minted-%R/* _minted-%R';
