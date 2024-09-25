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
        MAVEN_SETTINGS: |
          <settings>
            <mirrors>
              <mirror>
                <id>nexus-public</id>
                <mirrorOf>*</mirrorOf>
                <url>https://dev.ocseops.com/nexus/content/groups/public</url>
              </mirror>
            </mirrors>
          </settings>

    - name: Build with Maven
      run: mvn clean compile package


