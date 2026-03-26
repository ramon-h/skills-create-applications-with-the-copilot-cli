#!/usr/bin/env node

/**
 * Node.js CLI Calculator
 *
 * Supported operations:
 *   add      - Addition (+): adds two numbers
 *   subtract - Subtraction (-): subtracts the second number from the first
 *   multiply - Multiplication (×): multiplies two numbers
 *   divide   - Division (÷): divides the first number by the second
 *
 * Usage:
 *   node calculator.js <operation> <num1> <num2>
 *
 * Examples:
 *   node calculator.js add 5 3        → 8
 *   node calculator.js subtract 10 4  → 6
 *   node calculator.js multiply 6 7   → 42
 *   node calculator.js divide 15 3    → 5
 */

const [,, operation, arg1, arg2] = process.argv;

// Addition (+): returns the sum of two numbers
function add(a, b) {
  return a + b;
}

// Subtraction (-): returns the difference of two numbers
function subtract(a, b) {
  return a - b;
}

// Multiplication (×): returns the product of two numbers
function multiply(a, b) {
  return a * b;
}

// Division (÷): returns the quotient of two numbers
function divide(a, b) {
  if (b === 0) {
    throw new Error('Division by zero is not allowed');
  }
  return a / b;
}

function calculate(operation, a, b) {
  switch (operation) {
    case 'add':      return add(a, b);
    case 'subtract': return subtract(a, b);
    case 'multiply': return multiply(a, b);
    case 'divide':   return divide(a, b);
    default:
      throw new Error(`Unknown operation: "${operation}". Use add, subtract, multiply, or divide.`);
  }
}

function main() {
  if (!operation || arg1 === undefined || arg2 === undefined) {
    console.error('Usage: node calculator.js <operation> <num1> <num2>');
    console.error('Operations: add, subtract, multiply, divide');
    process.exit(1);
  }

  const num1 = parseFloat(arg1);
  const num2 = parseFloat(arg2);

  if (isNaN(num1) || isNaN(num2)) {
    console.error('Error: num1 and num2 must be valid numbers');
    process.exit(1);
  }

  try {
    const result = calculate(operation, num1, num2);
    console.log(`${num1} ${operation} ${num2} = ${result}`);
  } catch (err) {
    console.error(`Error: ${err.message}`);
    process.exit(1);
  }
}

main();
