from datetime import datetime, date, timezone, timedelta
from pathlib import PurePath, Path
import json


class jekyllFileTool():
    def __init__(self, targetDirPath=Path.cwd()):
        self.rootDirPath = Path(targetDirPath).resolve()
        self.outputDirPath = (self.rootDirPath/"output").resolve()
        self.outputDirPath.mkdir(mode=0o750, parents=False, exist_ok=True)

    def formatMdFilename(self, jsonStr):
        parsedDict = json.loads(jsonStr)
        newFileName = ""
        for path in self.rootDirPath.glob("*.md"):
            try:
                parsedDict['title'] = path.stem.replace('_', ' ')
                newFileName = "".join([datetime.fromtimestamp(path.stat().st_mtime).strftime(
                    "%Y-%m-%d"), "-", path.name])
                Path(self.outputDirPath / newFileName).write_text(
                    "".join(["---\n", json.dumps(parsedDict),
                             "\n---\n", path.read_bytes().decode()])
                )
            except UnicodeDecodeError as err:
                print(path.name)
                print(err)
                pass


testData = '{"layout": "post","categories": "Installation","title":"","feature-img": "assets/img/feature_img.png"}'
targetPath = input('set target path(default=current dir path):')
tool = jekyllFileTool(targetPath)
tool.formatMdFilename(testData)

# tool.appendText()
