# Añadiendo galería a mi sitio web usando llgal

2024-12-05

Hoy me recorde que hace mucho tiempo estaba jugando con [llgal](https://github.com/bgoglin/llgal)
para la creacion de una galaria. Inmediatamente se me vino la idea, que puedo integrar una para mi sitio web.

El uso que le voy a dar, es para ver desde la galeria todas las fotos de mi web.
De momento las fotos no son muchas, pero el tiempo pasa, alguna vez seguro que necesitare buscar alguna rapido y tener sitio desde donde puedo hacer esto me sera util y ademas es chulo .

## Instalar llgal en Ubuntu 24.04 

~~~sh
sudo apt install llgal
~~~

## Integrar con mi web

Vamos al directorio `~/website/public/images` donde estan ubicadas todas las imagenes usadas para los posts de mi blog .

~~~sh
cd ~/website/public/images 
~~~

Creamos el seguiente directorio `.llgal`

~~~sh
mkdir .llgal
~~~

Generamos el archivo de configuracion por defecto.

~~~sh
llgal --gencfg ~/website/public/images/.llgal/my_llgalrc
~~~

Editamos el archivo de configuracion `my_llgalrc`

~~~sh
nano my_llgalrc
~~~

Aqui he editado, sobre mis criterios .
Mi configuracion al momento de crear este post.

~~~sh
# This is a llgal configuration file.
# You may modify and reuse it as you want.

##### Name of generic llgal files #####

# Name of the CSS file.
# Such a file will be stored under $local_llgal_dir.
css_filename = "llgal.css"

# Name for image link to the index, previous or next slide
# index_link_image_filename = "index.png"
prev_slide_link_image_filename = "prev.png"
next_slide_link_image_filename = "next.png"

# Name of the index template.
# Such a template file will be used during gallery generation.
indextemplate_filename = "indextemplate.html"

# Name of the slide template.
# Such a template file will be used during gallery generation.
slidetemplate_filename = "slidetemplate.html"

##### Location of llgal files if available on the web #####

# Location of the CSS file if available on the web [--uc <url>].
# If ending with '/', css_filename will be added.
# css_location = ""

# Location of llgal image files if available on the web.
# If ending with '/', their generic filename will be added.
# These locations may be set alltogether with --ui <url>.
# filmtile_location = ""
# index_link_image_location = ""
# prev_slide_link_image_location = ""
# next_slide_link_image_location = ""

##### Location and name of generated files #####

# Local subdirectory where llgal files generated files will be stored.
# This option is only available in system- and user-wide configuration
# files.
# Note that HTML files are generated in place while captions and CSS
# are kept in this subdirectory.
# Gallery specific HTML templates and llgalrc configuration file
# might also be defined here.
local_llgal_dir = "~/website/public/images"

# Name of the generated index file [-i <s>]
# index_filename = "index"

# Prefix of generated HTML slide filenames
# Note that this prefix is used to decide what HTML to delete when --clean
# is passed. Setting this option to an empty string will make llgal remove
# all HTML files.
# slide_filenameprefix = "slide_"

# Prefix used to determine the filenames of scaled image that are
# shown in slides (in case of --sx or --sy).
# These files will be stored under $local_llgal_dir.
# scaled_image_filenameprefix = "scaled_"

# Prefix used to determine thumbnail filenames from original images.
# These files will be stored under $local_llgal_dir.
# thumbnail_image_filenameprefix = "thumb_"

# Name of the captions file that will be generated when llgal is called
# with --gc. This file will be stored under $local_llgal_dir.
# captions_filename = "captions"

# Additional prefix of user-provided scaled images
# user_scaled_image_filenameprefix = "my"

# Additional prefix of user-provided thumbnails
# user_thumbnail_image_filenameprefix = "my"

# Character to use to replace / in the thumbnail/scaled of subdir images
# path_separator_replacement = "@"

##### Index #####

# Cellpadding in the index table [-p <n>]
# Must be >= 0, setting to < 0 resets to default
# index_cellpadding = 3

# Display links and text as regular text instead of thumbnails
# in the main gallery thumbnail index [-L]
# list_links = 0

# Pixels per row of thumbnails in index [--wx <n>]
# Must be > 0, 0 means unlimited, setting to < 0 resets to default
# pixels_per_row = 0

# Thumbnails per row in index [-w <n>]
# Must be > 0, 0 means unlimited, setting to < 0 resets to default
thumbnails_per_row = 5

# Do not output any absolute thumbnail sizes in HTML code and assume the
# CSS style sheet will take care of it (in table.index [td.image-slide [img]])
# thumbnails_dimensions_from_css = 0

# Maximal height of thumbnails [--ty <n>]
# Must be > 0, setting to < 0 resets to default
# Changing this value does not affect the maximal width (see thumbnail_width_max)
thumbnail_height_max = 640

# Maximal width of thumbnails [--tx <n>]
# Must be > 0, 0 means unlimited, setting to < 0 resets to default
# Changing this value does not affect the maximal height (see thumbnail_height_max)
thumbnail_width_max = 400

# Write captions under thumbnails [-u]
# show_caption_under_thumbnails = 0

# Show a film effect in the index of thumbnails [--fe]
show_film_effect = 1

# Make thumbnail links point to the target object instead of
# the corresponding slide
# MVI_link_to_target = 0
# FIL_link_to_target = 0
# DIR_link_to_target = 0
# LNK_link_to_target = 0

##### Text #####

# Default title of the gallery.
# May be overridden with [--title <s>] or TITLE: in the captions file.
index_title_default = "Indice de fotos"

# Change text in links to parent directory.
# parent_gallery_link_text = "Back to parent gallery"

# Change text in links to previous gallery.
prev_gallery_link_text = "Galeria anterior "

# Change text in links to next directory.
next_gallery_link_text = "Siguiente galeria "

# Label of the link from a slide to the index
index_link_text = "Indice"

# Label of the link from a slide to the previous one
prev_slide_link_text = "&lt;&lt;Anterior"

# Label of the link from a slide to the next one
next_slide_link_text = "Siguiente&gt;&gt;"

# Text prefixing the filename when generating link text
# for movies without a captions file.
# MVI_link_text = "Open movie "

# Text prefixing the filename when generating link text
# for files without a captions file.
FIL_link_text = "Descargar archivo "

# Text prefixing the filename when generating link text
# for directories without a captions file.
DIR_link_text = "Abrir subgaleria "

# Text shown as image alternative for full-size images in slides
# alt_full_text = ""

# Text shown as image alternative for scaled images in slides
#alt_scaled_text = "Scaled image "

# Text shown as image alternative for thumbnails in the index
# alt_thumbnail_text = "Thumbnail "

# Text shown as an image alternative for the film tile in the index
# alt_film_tile_text = "Film tile"

# Text shown when the mouse pointer is over a scaled image in a slide
over_scaled_text = "Click para ver tamaño completo "

# Text shown when the mouse pointer is over a thumbnail
over_thumbnail_text = "Click para ampilar "

# Text shown when the mouse pointer is over a link from a slide to the index
over_index_link_text = "Volver al indice "

# Text shown when the mouse pointer is over a link from a slide to the previous one
over_prev_slide_link_text = "Imagen interior "

# Text shown when the mouse pointer is over a link from a slide to the next one
over_next_slide_link_text = "Imagen seguiente "

# Unit to be used when printing sizes [--asu <s>]
# show_size_unit = "kB"

# Set timestamp format in captions (when enabled) using strftime format [--ct <s>]
# timestamp_format_in_caption = "%Y-%m-%d %H:%M:%S"

# Credits line at the bottom of the index
credits_text = "Creado con <a href="https://github.com/bgoglin/llgal">llgal</a>"

##### What files to insert in the gallery #####

# Extensions that are matched when searching images (|-separated list)
image_extensions = "jpg|jpeg|gif|png|tif|tiff|bmp|webp"

# Extensions that are matched when searching movies (|-separated list)
movie_extensions = "mpg|mpeg|avi|mov|ogm|wmv|mp4|3gp|webm"

# Add all files to the list of entries
# not only images and movies [-A]
# add_all_files = 0

# Add subdirectories to the list of entries [-S]
# add_subdirs = 0

# Exclude files whose name matches [--exclude <s>]
# This option may be used several times.
# exclude = "regexp"

# Include files whose name matches and were previously excluded [--include <s>].
# This option may be used several times.
# The order of includes and excludes is respected.
# include = "regexp"

# Sort criteria when scanning files in the working directory [--sort]
sort_criteria = "name"

##### Sections #####

# Add a new subdirectory to the list of sections [-P]
#section_dir = "~/website/images/new_dir"

# Add all subdirectories to the list of sections [--Pall]
# recursive_sections = 0

# Add the subdirectory name as a title at the beginning of each section [--Ps]
# entitle_sections = 0

# Add a horizontal line at the beginning of each section in the index [--Ps]
separate_sections = 1

##### Recursion #####

# Run recursively in subdirectories [-R]
# recursive = 0

# Add links between subgalleries [--Rl]
# link_subgalleries = 0

# Add links to the parent directory [--parent-gal]
# parent_gallery_link = 0

##### Various #####

# Additional configuration file [--config <s>]
# This option may be used multiple times.
# additional_configuration_file = "my_llgal.rc"

# Additional template directories [--templates].
# This option may be used multiple times.
# additional_template_dir = "path"

# Codeset to be set in HTML headers [--codeset <s>]
# codeset = "codeset"

# Language to be used for generated text in HTML pages [--lang <s>]
# If set, the LANGUAGE environment variable might prevent this option from working.
# language = "locale"

# Command to be used to generate scaled images and thumbnails
# thumbnail_create_command = "convert -scale <MAXW>x<MAXH> -- <IN> <OUT>"
# scaled_create_command = "convert -scale <MAXW>x<MAXH> -- <IN> <OUT>"

# Force regeneration of thumbnails and scaled images [-f].
# force_image_regeneration = 0

# Print notice messages [-v]
verbose = 0

# Give access rights for www access [--www]
# www_access_rights = 0

# Extension of generate webpages [--php]
www_extension = "html"
~~~

Luego ejecuto `llgal` con este comando .

~~~sh
llgal --config /home/ivo/website/public/images/.llgal/my_llgalrc -d /home/ivo/website/public/images
~~~

Ahora tenemos la galeria echa con todo lo necesario.
He tenido que editar `llgal.css` para que se integra mejor con el estilo de mi web .
Luego ejecute de nuevo el comando mas arriba para que se actualiza con el nuevo estilo.

He modificado el archivo `footer.html` de mi web, apregando el buton para aceder a galeria .

## Finalmente

He creado un simple bash script para regenerar el web, la galeria, y alojar en el directorio root, desde donde se sirve todo.

~~~sh
#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as sudo / root"
  exit
fi

# update blog
make build
# update gallery
llgal --config /home/ivo/website/public/images/.llgal/my_llgalrc \
      -d /home/ivo/website/public/images
# sync to /var/www/my-website-dir
rsync -rv build/ /var/www/ivaylokuzev.eu
~~~
