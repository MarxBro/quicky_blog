# Template htaccess

Esto lo tenía por ahí; no recuerdo bien de donde salió pero me ha servido.

La idea es usar esto como template o esqueleto, y modificar comentar, poner, sacar cosas a gusto/necesidad.


    Options All -ExecCGI -Indexes -Includes +FollowSymLinks
     
    <IfModule mod_rewrite.c>
        RewriteEngine on
        RewriteBase /
        RewriteCond %{HTTP_HOST} ^exapmle
        RewriteRule (.*) http://www.example.com/$1 [R=301,L]
        RewriteCond %{THE_REQUEST} ^[A-Z]{3,9}\ /index\.php\ HTTP/
        RewriteRule ^index\.php$ http://www.example.com/ [R=301,L]
    </IfModule>
     
    DirectoryIndex index.php
     
    <IfModule mod_setenvif.c>
        SetEnv TZ Europe/Moscow
    </IfModule>
    ServerSignature Off
    #AddDefaultCharset UTF-8
    <ifModule mod_php.c>
        php_value   upload_max_filesize 32M
        php_value   post_max_size       10M
        php_value   default_charset utf-8
        php_value   max_execution_time 200
    </ifModule>
    AddHandler application/x-httpd-php .html
    AddHandler cgi-script .pl .py .jsp .asp .htm .shtml .sh .cgi
    AddType application/x-javascript .js
    AddType text/css .css
    AddType text/xml .xml
    AddType application/octet-stream .doc .mov .avi .pdf .xls
    # ForceType application/x-httpd-php
     
    <ifModule mod_deflate.c>
        AddOutputFilterByType DEFLATE text/html text/plain text/xml application/xml application/xhtml+xml text/css text/javascript application/javascript application/x-javascript
    </ifModule>
     
    <IfModule mod_gzip.c>
        mod_gzip_on         Yes
        mod_gzip_dechunk    Yes
        mod_gzip_item_include file        \.(html?|txt|css|js|php|pl)$
        mod_gzip_item_include mime        ^text\.*
        mod_gzip_item_include mime        ^application/x-javascript.*
        mod_gzip_item_exclude mime        ^image\.*
        mod_gzip_item_exclude rspheader    ^Content-Encoding:.*gzip.*
    </IfModule>
     
    <ifModule mod_headers.c>
        <FilesMatch "\.(html|htm)$">
            Header set Cache-Control "max-age=43200"
        </FilesMatch>
        <FilesMatch "\.(js|css|txt)$">
            Header set Cache-Control "max-age=604800"
        </FilesMatch>
        <FilesMatch "\.(flv|swf|ico|gif|jpg|jpeg|png)$">
            Header set Cache-Control "max-age=2592000"
        </FilesMatch>
        <FilesMatch "\.(pl|php|cgi|spl|scgi|fcgi)$">
            Header unset Cache-Control
        </FilesMatch>
    </IfModule>
     
    <ifModule mod_expires.c>
        ExpiresActive On
        # is default the cache in 5 seconds
        ExpiresDefault "access plus 5 seconds"
        #cache flash and images for a month
        ExpiresByType image/x-icon "access plus 2592000 seconds"
        ExpiresByType image/jpeg "access plus 2592000 seconds"
        ExpiresByType image/png "access plus 2592000 seconds"
        ExpiresByType image/gif "access plus 2592000 seconds"
        ExpiresByType application/x-shockwave-flash "access plus 2592000 seconds"
        #cache css, javascript and text files for one week
        ExpiresByType text/css "access plus 604800 seconds"
        ExpiresByType text/javascript "access plus 604800 seconds"
        ExpiresByType application/javascript "access plus 604800 seconds"
        ExpiresByType application/x-javascript "access plus 604800 seconds"
        #to cache html and htm files for one day
        ExpiresByType text/html "access plus 43200 seconds"
        #cached xml files for 10 minutes
        ExpiresByType application/xhtml+xml "access plus 600 seconds"
    </ifModule>
     
    # Bad Rquest
    ErrorDocument 400 /400.html
    # Authorization Required
    ErrorDocument 401 /401.html
    # Forbidden
    ErrorDocument 403 /403.html
    # Not found
    ErrorDocument 404 /404.html
    # Method Not Allowed
    ErrorDocument 405 /405.html
    # Request Timed Out
    ErrorDocument 408 /408.html
    # Request URI Too Long
    ErrorDocument 414 /414.html
    # Internal Server Error
    ErrorDocument 500 /500.html
    # Not Implemented
    ErrorDocument 501 /501.html
    # Bad Gateway
    ErrorDocument 502 /502.html
    # Service Unavailable
    ErrorDocument 503 /503.html
    # Gateway Timeout
    ErrorDocument 504 /504.html
    
Zaijian.