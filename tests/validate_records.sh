SCHEMAS="test_schemas/schemas.xsd"
LETTERS_FOR_TESTING="../Letters for Testing"


testShunitInstalled() {
    assertNotNull $(which shunit2)
}

testIfLettersAreValid() {
    for filename in "$LETTERS_FOR_TESTING"/*.xml; do
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