import { ChemicalServer } from "chemicaljs";
import express from "express";
const build = new ChemicalBuild({
    path: "dist",
    default: "uv",
    uv: true,
    scramjet: true,
    meteor: true,
    rammerhead: false,
});
build.write(true)
const [app, listen] = new ChemicalServer();
const port = process.env.PORT || 3000;

app.use(express.static("public", {
    index: "index.html",
    extensions: ["html"]
}));

app.serveChemical();

app.use((req, res) => {
    res.status(404);
    res.send("404 Error");
});

listen(port, () => {
    console.log(`Basic example listening on port ${port}`);
});
