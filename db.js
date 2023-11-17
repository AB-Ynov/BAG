const mysql = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'votre_utilisateur',
    password: 'votre_mot_de_passe',
    database: 'votre_base_de_donnees'
});

db.connect((err) => {
    if (err) {
        console.error('Erreur de connexion à la base de données :', err);
    } else {
        console.log('Connecté à la base de données MySQL');
    }
});

module.exports = db;
