<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** Database username */
define( 'DB_USER', 'username_here' );

/** Database password */
define( 'DB_PASSWORD', 'password_here' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         '5e-I-f0 l}dmhNIH8W#%|(]rnnd^K>ENZf.MNJ|WGvH>PJgiKe1,;3P7(L2x]K72' );
define( 'SECURE_AUTH_KEY',  '{_^R[| 3I-r}WQM`nnn[=;F:UG_h<)7^kPh<8#8/+9Ol]B?ngLEws=SL0P?b,M@L' );
define( 'LOGGED_IN_KEY',    'ER/MjLkpEZ3A#}np4[6ot`]MT  sHf}(dV<aaqu /E$1FJR<e07;kiUV@B-+TA3v' );
define( 'NONCE_KEY',        'euSEISr-2X7Vlq`<`C`@pF=rI%Bqcy4>=GeKh p?GDran)u^a9zQa,3-3YLr_MLJ' );
define( 'AUTH_SALT',        '~WN_>>+odSDer7+9C^XAiv>_3rZ35gBg*T33P00yDH,$1$~zgdVblLm~rDEq6ura' );
define( 'SECURE_AUTH_SALT', '%j;esVfUO*^e(b9PUZ|?U{MITA/u9iGjtK6IA15g3iyoXV-Le |)?-R*Q(hrdG?H' );
define( 'LOGGED_IN_SALT',   'z*#cBT-V{,DpzdxaGxJ^|qra^&Rxp6f1kj[ x]VK.FyiF7=MENoH%~30xDIMk|yg' );
define( 'NONCE_SALT',       'bgfX:.be_&_7mmDo{s0,0>0P^A0QCMf.;fSh#h{D.-?Lo ?C%V=EMT}o,-VUXZV-' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
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