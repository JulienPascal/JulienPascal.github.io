echo "creating md"
jupyter nbconvert --to markdown OLSMachineLearning.ipynb
echo "renaming md"
mv OLSMachineLearning.md index.md
