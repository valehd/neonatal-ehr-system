from flask import Flask
from routes.medication_routes import medication_bp
from routes.patient_routes import patient_bp
from routes.control_routes import control_bp
from routes.vaccine_routes import vaccine_bp
from routes.diagnosis_routes import diagnosis_bp



app = Flask(__name__)

app.register_blueprint(patient_bp)
app.register_blueprint(control_bp)
app.register_blueprint(medication_bp)
app.register_blueprint(vaccine_bp)
app.register_blueprint(diagnosis_bp)

if __name__ == "__main__":
    app.run(debug=True)