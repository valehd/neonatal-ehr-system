from flask import Flask, render_template

app = Flask(__name__)


@app.route("/")
def patients():
    return render_template("patients.html")


@app.route("/new-patient")
def new_patient():
    return render_template("new_patient.html")


@app.route("/patient/<int:id>")
def patient_detail(id):
    return render_template("patient_detail.html")


if __name__ == "__main__":
    app.run(debug=True)