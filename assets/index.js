function copyToClipboard() {
    const codeBlock = document.getElementById('code-block').innerText;
    navigator.clipboard.writeText(codeBlock).then(() => {
        document.getElementById('message').innerText = 'Code copied to clipboard!';
    }).catch(err => {
        document.getElementById('message').innerText = 'Failed to copy code.';
        console.error('Failed to copy: ', err);
    });
}