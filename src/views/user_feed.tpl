% rebase('base.tpl')

% include('user_menu.tpl')

<main>
  <div class="container">
    <div class="section">
      <div class="row">
        <div class="col s12 m9 l6">
        % if no_tasks_available:
          <div class="card orange darken-1">
            <div class="card-content white-text">
              <p>Похоже, у нас кончились задания. Загляни сюда еще раз через полчаса.</p>
            </div>
          </div>
        % end

        % for task in tasks:
          % if task.is_photo_required:
            % if task.is_complete:
            <div class="card">
              <div class="card-image">
                <img src="{{task.photo_url}}">
                <span class="card-title">
                  Ты
                  % if task.partner:
                  и {{task.partner.name}}
                  % end
                </span>
              </div>
              <div class="card-content">
                <p>{{task.description}}</p>
              </div>
              % if not task.is_approved:
              <div class="card-action valign-wrapper">
                <a href="/" class="btn orange darken-2 white-text no-margin"><i class="mdi-action-schedule left"></i>
                  Проверяем
                </a>
              </div>
              % end
            </div>
            % else:
            <div class="card {{'red darken-2' if task.is_rejected else 'blue-grey darken-1'}}">
              <div class="card-content white-text">
                <span class="card-title">
                  Ты
                  % if task.partner:
                  и {{task.partner.name}}
                  % end
                </span>
                <p>{{task.description}}</p>
                % if task.is_rejected:
                <p>Модератор отклонил эту фотографию, потому что она не соответствует заданию.</p>
                % end
              </div>
              <div class="card-action valign-wrapper">
                <form action="/user/upload_photo" method="POST" enctype="multipart/form-data" class="no-margin">
                  <input type="hidden" name="task_id" value="{{task.id}}">
                  <label class="btn waves-effect waves-light no-margin"><i class="mdi-file-cloud-upload left"></i>
                    Загрузить
                    <input type="file" name="photo_file">
                  </label>
                </form>
              </div>
            </div>
            % end
          % end
        % end
        </div>
      </div>
    </div>
  </div>
</main>
