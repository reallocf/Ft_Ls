/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_lprint_functions.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/16 15:36:32 by csummers          #+#    #+#             */
/*   Updated: 2016/12/16 15:36:32 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

static void		ls_lprint_two(char *path, char *name, struct stat **stats)
{
	char	*temp;
	int		temp_int;

	if (S_ISLNK((*stats)->st_mode))
	{
		if (!(temp = (char*)malloc(sizeof(char) * MAX_FNAME_LEN)))
			ls_die(NULL);
		if ((temp_int = readlink(path, temp, MAX_FNAME_LEN)) == -1)
			ls_die(NULL);
		temp[temp_int] = '\0';
		if (ft_printf(" %s -> %s\n", name, temp) == -1)
			ls_die(NULL);
		ft_strdel(&temp);
	}
	else if (ft_printf(" %s\n", name) == -1)
		ls_die(NULL);
	free(*stats);
}

void			ls_lprint(char *path, char *name, t_ls *ls_f, t_lflag *lflag)
{
	struct stat		*stats;
	int				is_special_file;

	if (!(stats = (struct stat*)malloc(sizeof(struct stat))))
		ls_die(NULL);
	if (lstat(path, stats) == -1)
		ls_die(NULL);
	is_special_file = ls_print_file_type(stats->st_mode);
	ls_print_permissions(stats->st_mode);
	if (ft_printf("%*zu %-*s%-*s ", lflag->link_width, stats->st_nlink,
					lflag->name_width, getpwuid(stats->st_uid)->pw_name,
					lflag->group_width, getgrgid(stats->st_gid)->gr_name) == -1)
		ls_die(NULL);
	if (is_special_file)
	{
		if (ft_printf("%*zu, %*zu", lflag->major_width, MAJOR(stats->st_rdev),
						lflag->minor_width, MINOR(stats->st_rdev)) == -1)
			ls_die(NULL);
	}
	else if (ft_printf("%*zu", lflag->size_width, stats->st_size) == -1)
		ls_die(NULL);
	ls_print_timing(stats, ls_f);
	ls_lprint_two(path, name, &stats);
}

static size_t	ls_get_special_size_width(dev_t dev, t_lflag *ret)
{
	size_t	major_width;
	size_t	minor_width;

	major_width = ls_get_digits(MAJOR(dev));
	minor_width = ls_get_digits(MINOR(dev));
	if (major_width < 3)
		major_width = 3;
	if (minor_width < 3)
		minor_width = 3;
	ret->major_width = major_width;
	ret->minor_width = minor_width;
	if (ret->size_width > major_width + minor_width + 2)
		return (ret->size_width);
	else
		return (major_width + minor_width + 2);
}

static void		ls_update_lflag(t_lflag **ret, char *path, size_t *block_count)
{
	struct stat		*temp;
	size_t			temp_width;

	if (!(temp = (struct stat*)malloc(sizeof(struct stat))))
		ls_die(NULL);
	if (lstat(path, temp) == -1)
		ls_die(NULL);
	if ((temp_width = ls_get_digits(temp->st_nlink)) + 2 > (*ret)->link_width)
		(*ret)->link_width = temp_width + 2;
	if ((temp_width = ft_strlen(getpwuid(temp->st_uid)->pw_name)) + 2 >
		(*ret)->name_width)
		(*ret)->name_width = temp_width + 2;
	if ((temp_width = ft_strlen(getgrgid(temp->st_gid)->gr_name)) + 1 >
		(*ret)->group_width)
		(*ret)->group_width = temp_width + 1;
	if (S_ISBLK(temp->st_mode) || S_ISCHR(temp->st_mode))
		(*ret)->size_width = ls_get_special_size_width(temp->st_rdev, *ret);
	else if ((temp_width = ls_get_digits(temp->st_size)) > (*ret)->size_width)
		(*ret)->size_width = temp_width;
	*block_count += temp->st_blocks;
	free(temp);
}

t_lflag			*ls_configure_lprint(char **files, t_ls *ls_f, _Bool one)
{
	size_t		block_count;
	char		**files_ptr;
	t_lflag		*ret;

	block_count = 0;
	files_ptr = files;
	ret = ls_initialize_lflag();
	while (*files_ptr)
	{
		if (*ls_get_after_slash(*files_ptr) != '.' || ls_f->a)
			ls_update_lflag(&ret, *files_ptr, &block_count);
		files_ptr++;
	}
	if (!one && (ls_f->a || *(files + 2)))
		if (ft_printf("total %zu\n", block_count) == -1)
			ls_die(NULL);
	return (ret);
}
