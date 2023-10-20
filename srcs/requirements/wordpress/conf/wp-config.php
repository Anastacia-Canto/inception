<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'my_database' );

/** Database username */
define( 'DB_USER', 'my_db_user' );

/** Database password */
define( 'DB_PASSWORD', 'my_db_password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '^OivC;4.>W R!B=0M3 M8wW@(t.*AG:`2rk_v-kB;S%<7D4g(! o1}HZ+v8<(&O4');
define('SECURE_AUTH_KEY',  'J~z$E+-dOIoWo490R$h/r|])2M/;NCz/Y%p4r;PE=}+<xj|(!JS9zLuNrgjNfds1');
define('LOGGED_IN_KEY',    '*~KjVcM`gk3-oQg<V+z-b;b7XP2L(MoY%ejr=gddh@EIxx_#+Z6x!IOW5AO-0>!k');
define('NONCE_KEY',        '`b)OHo|x: *IHa(%do=i5v,+9 6US8g#3>^[lXmD ]#p[b-e@|{yKM@8k+f~HemV');
define('AUTH_SALT',        '{)A+Ww-i]|vbMCXUCWyJS2v QId/:,:a#HRRIey<$TV4C>iUZ}:A-^eGC%|QVLtH');
define('SECURE_AUTH_SALT', ']g:K#haWqog+t@NCv+8+mop|=+|`$`: &D%v|{I<|qU_ihAb[ucY9oye;wMw=dI!');
define('LOGGED_IN_SALT',   'd92+R!3(e,ILo/q(<}TlGa2J|jNe4qyTv4?!B7%qy9vjucVZx@D(p!~Q>hM0@/_7');
define('NONCE_SALT',       '#,5-T:VMz&_qUT;T85[}pxB@OA-t2Vlo%@!`)6%eO<u}tKTC#L#zu)yvga2xW}F>');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>