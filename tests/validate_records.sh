SCHEMAS="test_schemas/schemas.xsd"
ENCODED_LETTERS="../Encoded Letters"


testShunitInstalled() {
    assertNotNull $(which shunit2)
}

testIfLettersAreValid() {
    for filename in "$ENCODED_LETTERS"/*.xml; do
        echo "\nTesting $filename"
        RESPONSE=$(xmllint --noout --schema "$SCHEMAS" "$filename" 2>&1)
        EXIT_STATUS=$?

        if [ $EXIT_STATUS -eq 0 ]; then
            echo "\t$filename validates"
        else
            echo "\t$filename does not validate"
            echo "$RESPONSE"
        fi

        assertEquals "Validation failed for $filename" 0 $EXIT_STATUS
    done
}

. shunit2