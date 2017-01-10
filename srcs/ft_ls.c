/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_ls.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/12 22:29:27 by csummers          #+#    #+#             */
/*   Updated: 2016/12/12 22:29:28 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

static char		**ls_read_from_dir(DIR *dir_ptr, char *dir_name)
{
	struct dirent	*file_ptr;
	char			*slash_dir_name;
	char			*path;
	char			**files;

	files = NULL;
	if (!(file_ptr = readdir(dir_ptr)))
	{
		if (errno == 2)
			ls_die(NULL);
		else
			return (NULL);
	}
	slash_dir_name = ls_add_slash(dir_name);
	while (file_ptr)
	{
		path = ft_strjoin(slash_dir_name, file_ptr->d_name);
		files = ft_realloc_s(&files, path);
		file_ptr = readdir(dir_ptr);
	}
	free(slash_dir_name);
	if (closedir(dir_ptr) == -1)
		ls_die(NULL);
	return (files);
}

void			ls_print_files(char **files, t_ls *ls_f, _Bool one)
{
	t_lflag		*lprint_info;
	char		**files_ptr;
	char		*name;

	files_ptr = files;
	if (ls_f->l)
		lprint_info = ls_configure_lprint(files, ls_f, one);
	while (*files_ptr)
	{
		name = (one) ? *files_ptr : ls_get_after_slash(*files_ptr);
		if (*name != '.' || ls_f->a)
		{
			if (ls_f->l)
				ls_lprint(*files_ptr, name, ls_f, lprint_info);
			else if (ft_printf("%s\n", name) == -1)
				ls_die(NULL);
		}
		files_ptr++;
	}
	if (ls_f->l)
		free(lprint_info);
}

void			ls_manipulate_dir(DIR *dir_ptr, t_ls *ls_f, char *dir_name)
{
	char	**files;
	t_dir	**dirs;
	t_dir	**dirs_ptr;

	if (!(files = ls_read_from_dir(dir_ptr, dir_name)))
		return ;
	ls_sort_files(files, ls_f, 0);
	ls_print_files(files, ls_f, 0);
	if (ls_f->cap_r && (dirs = ls_find_dirs(files, ls_f)))
	{
		dirs_ptr = dirs;
		while (*dirs_ptr)
		{
			ft_printf("\n%s:\n", (*dirs_ptr)->path);
			if ((*dirs_ptr)->ptr)
				ls_manipulate_dir((*dirs_ptr)->ptr, ls_f, (*dirs_ptr)->path);
			else if (ft_printf("%wft_ls: %s: Permission denied\n", 2,
								ls_get_after_slash((*dirs_ptr)->path)) == -1)
				ls_die(NULL);
			dirs_ptr++;
		}
		ls_delete_dirs(&dirs);
	}
	ls_strarrdel(&files);
}

int				main(int argc, char **argv)
{
	char	**files_and_dirs;
	DIR		*dir_ptr;
	t_ls	*ls_f;

	ls_f = ls_initialize();
	files_and_dirs = ls_organize_argv(ls_f, argc, argv);
	if (!files_and_dirs)
	{
		if (!(dir_ptr = opendir(".")))
			ls_die(".");
		ls_manipulate_dir(dir_ptr, ls_f, ".");
		free(ls_f);
		return (0);
	}
	ls_sort_files(files_and_dirs, ls_f, 1);
	ls_handle_argv(files_and_dirs, ls_f);
	ft_strarrdel(&files_and_dirs);
	free(ls_f);
	return (0);
}
