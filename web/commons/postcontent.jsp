<div class="container-fluid px-0">
    <div class="row form-group my-3 p-0 mx-0">
        <div class="col-md-2 text-center">
            <button type="button" class="btn content-btn" onclick="execCmd('bold');"><i class="fa fa-bold"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('italic');"><i class="fa fa-italic"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('underline');"><i class="fa fa-underline"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('strikeThrough');"><i class="fa fa-strikethrough"></i></button>
        </div>
        <div class="col-md-2 text-center">
            <button type="button" class="btn content-btn" onclick="execCmd('justifyLeft');"><i class="fa fa-align-left"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('justifyCenter');"><i class="fa fa-align-center"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('justifyRight');"><i class="fa fa-align-right"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('justifyFull');"><i class="fa fa-align-justify"></i></button>
        </div>
        <div class="col-md-2 text-center">
            <button type="button" class="btn content-btn" onclick="execCmd('cut');"><i class="fa fa-cut"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('copy');"><i class="fa fa-copy"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('undo');"><i class="fa fa-undo"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('redo');"><i class="fa fa-repeat"></i></button>
        </div>
        <div class="col-md-2 text-center">
            <button type="button" class="btn content-btn" onclick="execCmd('indent');"><i class="fa fa-indent"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('outdent');"><i class="fa fa-dedent"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('subscript');"><i class="fa fa-subscript"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('superscript');"><i class="fa fa-superscript"></i></button>

        </div>

        <div class="col-md-4 text-center">
            <button type="button" class="btn content-btn" onclick="execCmd('insertHorizontalRule');">HR</button>
            <button type="button" class="btn content-btn" onclick="execCommandWithArg('createLink', prompt('Enter a URL', 'http://'));"><i class="fa fa-link"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('unlink');"><i class="fa fa-unlink"></i></button>
            <button type="button" class="btn content-btn" onclick="toggleSource();"><i class="fa fa-code"></i></button>
            <button type="button" class="btn content-btn" onclick="execCommandWithArg('insertImage', prompt('Enter the image URL', ''));"><i class="fa fa-file-image-o"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('insertUnorderedList');"><i class="fa fa-list-ul"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('insertOrderedList');"><i class="fa fa-list-ol"></i></button>
            <button type="button" class="btn content-btn" onclick="execCmd('insertParagraph');"><i class="fa fa-paragraph"></i></button>

        </div>
    </div>
    <div class="row form-group mt-4 p-0 mx-0">
        <div class="col-md-2 text-center">
            <select class="form-control" onchange="execCommandWithArg('formatBlock', this.value);">
                <option value="select" selected disabled>Select Heading Style</option>
                <option value="H1">H1</option>
                <option value="H2">H2</option>
                <option value="H3">H3</option>
                <option value="H4">H4</option>
                <option value="H5">H5</option>
                <option value="H6">H6</option>
            </select>
        </div>


        <div class="col-md-2 text-center">
            <select class="form-control" onchange="execCommandWithArg('fontName', this.value);">
                <option value="select" selected disabled>Select Font</option>
                <option value="Arial">Arial</option>
                <option value="Comic Sans MS">Comic Sans MS</option>
                <option value="Courier">Courier</option>
                <option value="Georgia">Georgia</option>
                <option value="Tahoma">Tahoma</option>
                <option value="Times New Roman">Times New Roman</option>
                <option value="Verdana">Verdana</option>
                <option value="Calibri">Calibri</option>
                <option value="Century Gothic">Century Gothic</option>
                <option value="Segoe UI">Segoe UI</option>
            </select>
        </div>

        <div class="col-md-2 text-center">
            <select class="form-control" onchange="execCommandWithArg('fontSize', this.value);">
                <option value="select" selected disabled>Select Size</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>            
            </select>
        </div>
        <div class="col-md-4 form-inline text-center">
            Fore Color: <input class="form-control mx-3 p-1" type="color" onchange="execCommandWithArg('foreColor', this.value);" style="width: 5rem;">
            Background: <input class="form-control mx-3 p-1" type="color" onchange="execCommandWithArg('hiliteColor', this.value);" style="width: 5rem;">
        </div>
        <div class="col-md-2 text-center">
            <div class="row">
                <div class="col-md-6 px-1">
                    <button type="button" class="btn content-btn" onclick="toggleEdit();">Toggle Edit</button>
                </div>
                <div class="col-md-6 px-1">
                    <button type="button" class="btn content-btn" onclick="execCmd('selectAll');">Select All</button>
                </div>
            </div>
        </div>
    </div>
</div>

