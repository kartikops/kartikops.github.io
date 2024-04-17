// Function to fetch and display file content
function loadFile(fileName) {
    fetch(fileName)
        .then(response => response.text())
        .then(data => {
            document.getElementById('terraform-code').textContent = data;
            Prism.highlightAll();  // Re-run Prism to apply syntax highlighting to new content
        })
        .catch(error => console.error('Error loading the file:', error));
}

// Function to copy code from the code editor
function copyToClipboard() {
    const code = document.getElementById('terraform-code').textContent;
    navigator.clipboard.writeText(code)
        .then(() => alert('Code copied to clipboard!'))
        .catch(err => console.error('Error copying text: ', err));
}

// Event listener for the copy button (assumed to be part of your HTML)
document.getElementById('copy-button').addEventListener('click', copyToClipboard);
