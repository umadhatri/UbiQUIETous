const EVault = artifacts.require("EVault");
contract("EVault", (accounts) => {
  it("should allow a client to upload a document", async () => {
    const eVaultInstance = await EVault.deployed();

    // Assuming accounts[1] is a client
    const clientAddress = accounts[1];
    const documentHash = "123456789"; // Replace with an actual document hash

    // Upload a document
    await eVaultInstance.uploadDocument(documentHash, { from: clientAddress });

    // Get the total number of documents
    const totalDocuments = await eVaultInstance.totalDocuments();
    assert.equal(totalDocuments, 1, "Total documents should be 1");
    console.log("Total Documents:", totalDocuments.toNumber());


    // Check if the event was emitted
    const events = await eVaultInstance.getPastEvents("DocumentUploaded");
    assert.equal(events.length, 1, "DocumentUploaded event should be emitted");
    assert.equal(events[0].returnValues.client, clientAddress, "Event should reference the correct client");
  });
});