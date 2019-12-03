{**
 * Группировка полей
 * @param array  $prepend           Впереди
 * @param array  $items             Основное
 * @param array  $append            Сзади
 *}

{extends "component@component.layout"}
 
{block name="options" append}
    {component_define_params params=[ 
        'prepend'
        'items',
        'append'
    ]}

{/block}

{block 'content'}
    <div class="input-group">
        <div class="input-group-prepend">
            <button type="button" class="btn btn-outline-secondary">Action</button>
            <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="sr-only">Toggle Dropdown</span>
            </button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
              <div role="separator" class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Separated link</a>
            </div>
        </div>
        <input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
        <div class="input-group-append">
          <button type="button" class="btn btn-outline-secondary">Action</button>
          <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="sr-only">Toggle Dropdown</span>
          </button>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div role="separator" class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </div>
    </div>
{/block}

