from flask import Flask, request, jsonify

app = Flask(__name__)

# Implémentez la gestion de l'authentification ici
from flask import Flask, render_template, redirect, url_for
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user

app = Flask(__name__)
app.config['SECRET_KEY'] = 'votre_clé_secrète'

login_manager = LoginManager()
login_manager.init_app(app)

class User(UserMixin):
    def __init__(self, id):
        self.id = id

# Cette fonction est utilisée par Flask-Login pour charger un utilisateur
@login_manager.user_loader
def load_user(user_id):
    return User(user_id)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    user = User(request.form['user_id'])
    login_user(user)
    return redirect(url_for('protected'))

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('index'))

@app.route('/protected')
@login_required
def protected():
    return render_template('protected.html')

if __name__ == "__main__":
    app.run(debug=True)

# Implémentez la gestion de l'arbre généalogique ici
class Personne:
    def __init__(self, nom, mere=None, pere=None):
        self.nom = nom
        self.mere = mere
        self.pere = pere

# Stockez toutes les personnes dans un dictionnaire pour un accès facile
personnes = {}

@app.route('/ajouter_personne', methods=['POST'])
def ajouter_personne():
    nom = request.form['nom']
    mere = personnes.get(request.form['mere'])
    pere = personnes.get(request.form['pere'])
    personne = Personne(nom, mere, pere)
    personnes[nom] = personne
    return redirect(url_for('index'))

@app.route('/obtenir_personne/<nom>')
def obtenir_personne(nom):
    personne = personnes.get(nom)
    if personne is not None:
        return render_template('personne.html', personne=personne)
    else:
        return "Personne non trouvée", 404

@app.route('/obtenir_parents/<nom>')
def obtenir_parents(nom):
    personne = personnes.get(nom)
    if personne is not None:
        return render_template('parents.html', mere=personne.mere, pere=personne.pere)
    else:
        return "Personne non trouvée", 404

if __name__ == "__main__":
    app.run(debug=True)
