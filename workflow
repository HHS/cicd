jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Java
      uses: actions/setup-java@v3
      with:
        java-version: '8'

    - name: Configure Maven Settings
      run: |
        mkdir -p ~/.m2
        echo "$MAVEN_SETTINGS" > ~/.m2/settings.xml
      env:
        MAVEN_SETTINGS: ${{ secrets.MAVEN_SETTINGS }}  # Store the settings.xml content in a GitHub secret

    - name: Build with Maven
      run: mvn clean compile package
      env:
        REPO_USERNAME: ${{ secrets.REPO_USERNAME }}  # GitHub secret for repository username
        REPO_PASSWORD: ${{ secrets.REPO_PASSWORD }}  # GitHub secret for repository password


