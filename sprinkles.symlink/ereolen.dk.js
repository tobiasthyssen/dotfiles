const buffer = [];
let recordingId;
const actionButton = document.createElement("button");
const observer = new MutationObserver(saveEbookContentToBuffer);

function getContentFromFrame (iframe) {
  return iframe.contentDocument.documentElement.outerHTML
}

function moveOn() {
  window.dispatchEvent(new KeyboardEvent("keyup", {'keyCode':39}))
}

function saveEbookContentToBuffer (mutationList) {
  // Go through all mutations
  mutationList.forEach((mutation) => {

    // Go through all added nodes
    mutation.addedNodes.forEach((node) => {

      // If node is an iframe, add onload trigger
      if (node.tagName === "IFRAME") {
        node.onload = () => buffer.push(getContentFromFrame(node));
      }
    });
  });
}

function initiateRecording() {
  // Change actionButton
  actionButton.innerText = "Stop recording ⏹️";
  actionButton.onclick = stopRecording;

  // Start observer
  observer.observe(document.getElementById("frame-container"), { childList: true });

  // Start moving right
  recordingId = setInterval(moveOn, 100);
}

function stopRecording () {
  // Stop moving
  clearInterval(recordingId);

  // Stop observer
  observer.disconnect();

  // Change actionButton
  actionButton.innerText = "Download book 📥";
  actionButton.onclick = saveBook;
}

function saveBook () {
  // Clean Buffer
  const cleanedBuffer = buffer.filter(entry => entry !== "<html><head></head><body></body></html>");

  // Add buffer to a blop
  const bookBlop = new Blob(cleanedBuffer, {type: "text/html"});

  // Convert your blob into a Blob URL (a special url that points to an object in the browser's memory)
  const blobUrl = URL.createObjectURL(bookBlop);

  // Open url
  window.open(blobUrl);
}

function setup () {
  actionButton.innerText = "Record 🔴";
  actionButton.classList.add("record-button");

  document.body.appendChild(actionButton);

  actionButton.onclick = initiateRecording;
}

setup();
