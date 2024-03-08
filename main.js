await loadWasm();

import { Vec2D, demoAnimation } from "./animation.js";

// exécuter la fonction q_rsqrt
const ExecButton1 = document.querySelector("#exec-q-sqrt");
ExecButton1.addEventListener("click", () => {
  let value = parseFloat(document.querySelector("#q-sqrt-input").value);
  document.querySelector("#q-sqrt-result").innerText =
    wasmExports.q_rsqrt(value);
});

/**
 * Add a step to the steps div
 * @param {number} num
 * @param {string} elem
 * @param {string} content
 * @returns {void}
 */
function addStep(num, elem, content) {
  let stepElement = document.createElement(elem);
  stepElement.innerHTML = `${num} - ${content}`;
  stepsDiv.appendChild(stepElement);
}

export function LaTeXVector(x, y) {
  return `\\pmatrix{${x} \\\\ ${y}}`;
}

function createSteps() {
  stepsDiv.innerHTML = "";
  if (!demoAnimation.getVector()) return;
  let { x, y } = demoAnimation.getVector();
  addStep(
    1,
    "p",
    `Voici notre vecteur \\(\\vec{v}: \n${demoAnimation.getVector().toLaTeX()}\\)`
  );
  let alpha = x ** 2 + y ** 2;
  addStep(
    2,
    "p",
    `Admettons alors : $$\\alpha = x^2 + y^2 = ${x}^2 + ${y}^2 = ${alpha}$$`
  );
  let beta = wasmExports.q_rsqrt(alpha);
  addStep(
    3,
    "p",
    `On va alors pouvoir exécuter notre algorithme : $$\\beta = \\frac{1}{\\sqrt{\\alpha}} = \\frac{1}{\\sqrt{${alpha}}} = q\\_rsqrt(\\alpha) = ${beta}$$`
  );
  let vecW = new Vec2D(x * beta, y * beta, false);
  addStep(
    4,
    "p",
    `Ainsi, avec ce coefficient \\(\\beta\\), on va pouvoir trouver notre vecteur normalisé \\(\\vec{w}\\) : 
  $$\\vec{w} = ${LaTeXVector(
    "x_\\vec{v}\\times\\beta",
    "y_\\vec{v}\\times\\beta"
  )} = ${LaTeXVector(
      `${x}\\times\\beta`,
      `${y}\\times\\beta`
    )} = ${vecW.toLaTeX()}$$`
  );

  // Réinitialiser MathJax
  MathJax.typeset();
  console.log(MathJax);
  return vecW;
}

let stepsDiv = document.querySelector("#animation-steps");

let NormalizeButton = document.querySelector("#normalize-button");
NormalizeButton.addEventListener("click", () => {
  let normalizedVec = createSteps();
  demoAnimation.normalized = normalizedVec;
});
